import 'package:flutter/material.dart';
import 'dart:convert';

import '../model/bubble_model.dart';
import '../model/donut_model.dart';
import '../model/schema_model.dart';
import '../model/table_model.dart';
import '../services/geo_api.dart';
import 'data_parser.dart';

class ReportViewModel extends ChangeNotifier {
  final GeoApiService apiService;

  // 메인 차트 데이터들
  List<BubbleData> keywordBubbleData = [];
  List<ChartDataItem> schemaChartData = [];
  List<ChartDataItem> queryResultsChartData = [];
  List<TableItem> checklistTableData = [];
  List<BubbleData> bubbleChartData = [];
  List<BubbleData> keywordVolumeBubbleData = [];
  List<DonutChartItem> donutChartData = [];

  // 상태 관리
  bool isLoading = false;
  String? error;

  // 추가 데이터 (필요시 사용)
  Map<String, dynamic> rawJsonData = {};
  int totalQueries = 0;
  int highQualityPages = 0;

  // 생성자 - 클래스명과 일치시킴
  ReportViewModel(this.apiService);

  /// 메인 데이터 가져오기 및 파싱
  Future<void> fetchAndProcessData() async {
    try {
      isLoading = true;
      error = null;
      notifyListeners();

      // 1. API에서 JSON 받아옴
      final Map<String, dynamic> jsonData = await apiService.getGeoData(3);
      rawJsonData = jsonData;

      // 2. 개별 파싱 방식 (더 세밀한 제어 가능)
      keywordBubbleData = DataParser.parseToChartData(jsonData);
      schemaChartData = DataParser.parseSchemaToChartData(jsonData);
      queryResultsChartData = DataParser.parseQueryResultsToChartData(jsonData);
      checklistTableData = DataParser.parseToTableData(jsonData);
      bubbleChartData = DataParser.parseToBubbleData(jsonData);
      keywordVolumeBubbleData = DataParser.parseKeywordVolumeToBubbleData(jsonData);
      donutChartData = DataParser.parseToDonutData(jsonData);

      // 3. 추가 통계 정보 추출
      _extractAdditionalStats(jsonData);

      error = null;
    } catch (e) {
      error = _handleError(e);
      _clearAllData();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  /// 통합 파싱 방식으로 데이터 가져오기 (대안)
  Future<void> fetchWithIntegratedParser() async {
    try {
      isLoading = true;
      error = null;
      notifyListeners();

      final Map<String, dynamic> jsonData = await apiService.getGeoData(3);
      rawJsonData = jsonData;

      // 통합 파싱 사용
      final jsonString = jsonEncode(jsonData);
      final processedData = await GeoDataProcessor.processGeoApiResponse(jsonString);

      // 데이터 할당
      keywordBubbleData = processedData['keywords'] ?? [];
      schemaChartData = processedData['schemas'] ?? [];
      queryResultsChartData = processedData['queryResults'] ?? [];
      checklistTableData = processedData['checklist'] ?? [];
      bubbleChartData = processedData['searchVolumes'] ?? [];
      keywordVolumeBubbleData = processedData['keywordVolumes'] ?? [];
      donutChartData = processedData['contentQuality'] ?? [];

      _extractAdditionalStats(jsonData);
      error = null;
    } catch (e) {
      error = _handleError(e);
      _clearAllData();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  /// 특정 차트 데이터만 새로고침
  Future<void> refreshSpecificChart(String chartType) async {
    if (rawJsonData.isEmpty) return;

    try {
      switch (chartType) {
        case 'keyword':
          keywordBubbleData = DataParser.parseToChartData(rawJsonData);
          break;
        case 'schema':
          schemaChartData = DataParser.parseSchemaToChartData(rawJsonData);
          break;
        case 'bubble':
          bubbleChartData = DataParser.parseToBubbleData(rawJsonData);
          break;
        case 'donut':
          donutChartData = DataParser.parseToDonutData(rawJsonData);
          break;
        case 'table':
          checklistTableData = DataParser.parseToTableData(rawJsonData);
          break;
      }
      notifyListeners();
    } catch (e) {
      error = '차트 새로고침 실패: ${e.toString()}';
      notifyListeners();
    }
  }

  /// 추가 통계 정보 추출
  void _extractAdditionalStats(Map<String, dynamic> jsonData) {
    try {
      totalQueries = (jsonData['queries'] as List<dynamic>?)?.length ?? 0;
      highQualityPages = jsonData['analysis']?['content_quality']?['high_quality_pages'] ?? 0;
    } catch (e) {
      // 통계 추출 실패는 에러로 처리하지 않음
      totalQueries = 0;
      highQualityPages = 0;
    }
  }

  /// 에러 타입별 처리
  String _handleError(dynamic e) {
    if (e.toString().contains('SocketException')) {
      return '네트워크 연결을 확인해주세요';
    } else if (e.toString().contains('FormatException')) {
      return '서버 응답 형식이 올바르지 않습니다';
    } else if (e.toString().contains('TimeoutException')) {
      return '요청 시간이 초과되었습니다';
    } else {
      return '데이터 처리 중 오류가 발생했습니다: ${e.toString()}';
    }
  }

  /// 모든 데이터 초기화
  void _clearAllData() {
    keywordBubbleData.clear();
    schemaChartData.clear();
    queryResultsChartData.clear();
    checklistTableData.clear();
    bubbleChartData.clear();
    keywordVolumeBubbleData.clear();
    donutChartData.clear();
    rawJsonData.clear();
    totalQueries = 0;
    highQualityPages = 0;
  }

  /// 데이터 유효성 검사
  bool get hasData =>
      keywordBubbleData.isNotEmpty ||
          checklistTableData.isNotEmpty ||
          bubbleChartData.isNotEmpty ||
          donutChartData.isNotEmpty;

  /// 각 차트별 데이터 존재 여부
  bool get hasKeywordData => keywordBubbleData.isNotEmpty;
  bool get hasSchemaData => schemaChartData.isNotEmpty;
  bool get hasTableData => checklistTableData.isNotEmpty;
  bool get hasBubbleData => bubbleChartData.isNotEmpty;
  bool get hasDonutData => donutChartData.isNotEmpty;

  /// 메모리 정리
  @override
  void dispose() {
    _clearAllData();
    super.dispose();
  }
}