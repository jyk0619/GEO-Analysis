import 'dart:convert';
import 'dart:math' as Math;


// 각 모델 import (실제 파일 경로에 맞게 수정)
import 'package:geo/model/table_model.dart';
import 'package:geo/model/schema_model.dart';
import 'package:geo/model/bubble_model.dart';
import 'package:geo/model/donut_model.dart';

class DataParser {
  
  /// JSON을 ChartDataItem 리스트로 변환 (상위 키워드 기준)
  static List<BubbleData> parseToChartData(Map<String, dynamic> jsonData) {
    final List<BubbleData> chartItems = [];
    
    final topKeywords = jsonData['analysis']['top_keywords'] as List<dynamic>? ?? [];
    
    for (var keyword in topKeywords) {
      chartItems.add(BubbleData(
        name: keyword['keyword']?.toString() ?? '',
        size: keyword['percentage'] ?? 0,
      ));
    }
    
    return chartItems;
  }
  
  /// JSON을 TableItem 리스트로 변환 (체크리스트 기준)
  static List<TableItem> parseToTableData(Map<String, dynamic> jsonData) {
    final List<TableItem> tableItems = [];
    
    final checklist = jsonData['analysis']['checklist'] as Map<String, dynamic>? ?? {};
    
    checklist.forEach((key, value) {
      // key를 사람이 읽기 쉬운 형태로 변환
      String displayName = _formatChecklistKey(key);
      
      tableItems.add(TableItem(
        name: displayName,
        trueCount: value['true_count']?.toString() ?? '0',
        total: value['total']?.toString() ?? '0',
        truePercentage: '${value['percentage']?.toString() ?? '0'}%',
      ));
    });
    
    return tableItems;
  }
  
  /// JSON을 BubbleData 리스트로 변환 (쿼리 검색량 기준)
  static List<BubbleData> parseToBubbleData(Map<String, dynamic> jsonData) {
    final List<BubbleData> bubbleItems = [];
    
    final queries = jsonData['queries'] as List<dynamic>? ?? [];
    
    for (var query in queries) {
      final searchVolume = query['search_volume'] ?? 0;
      // 검색량을 0~100 범위의 버블 크기로 변환 (로그 스케일 사용)
      double bubbleSize = _calculateBubbleSize(searchVolume);
      
      bubbleItems.add(BubbleData(
        size: bubbleSize,
        name: query['persona']?.toString() ?? '',
      ));
    }
    
    return bubbleItems;
  }
  
  /// JSON을 DonutChartItem 리스트로 변환 (콘텐츠 품질 기준)
  static List<DonutChartItem> parseToDonutData(Map<String, dynamic> jsonData) {
    final List<DonutChartItem> donutItems = [];
    
    final contentQuality = jsonData['analysis']['content_quality']['meaningful_content_summary'] 
        as Map<String, dynamic>? ?? {};
    
    contentQuality.forEach((key, value) {
      String title = _formatContentQualityKey(key);
      
      donutItems.add(DonutChartItem(
        title: title,
        value: (value['percentage'] ?? 0.0).toDouble(),
        current: value['count'] ?? 0,
        total: 155, // JSON에서 total은 고정값 155
      ));
    });
    
    return donutItems;
  }
  
  /// 스키마 데이터를 ChartDataItem으로 변환
  static List<ChartDataItem> parseSchemaToChartData(Map<String, dynamic> jsonData) {
    final List<ChartDataItem> chartItems = [];
    
    final topSchemas = jsonData['analysis']['top_schemas'] as List<dynamic>? ?? [];
    
    for (var schema in topSchemas) {
      chartItems.add(ChartDataItem(
        label: schema['schema']?.toString() ?? '',
        value: schema['count'] ?? 0,
      ));
    }
    
    return chartItems;
  }
  
  /// 키워드 볼륨을 BubbleData로 변환
  static List<BubbleData> parseKeywordVolumeToBubbleData(Map<String, dynamic> jsonData) {
    final List<BubbleData> bubbleItems = [];
    
    final keywordVolume = jsonData['analysis']['keyword_volume']['top_volume_keywords'] 
        as List<dynamic>? ?? [];
    
    for (var item in keywordVolume) {
      final volume = item['volume'] ?? 0;
      double bubbleSize = _calculateBubbleSize(volume);
      
      bubbleItems.add(BubbleData(
        size: bubbleSize,
        name: item['keyword']?.toString() ?? '',
      ));
    }
    
    return bubbleItems;
  }
  
  /// 쿼리별 LLM 결과를 ChartDataItem으로 변환
  static List<ChartDataItem> parseQueryResultsToChartData(Map<String, dynamic> jsonData) {
    final List<ChartDataItem> chartItems = [];
    
    final queries = jsonData['queries'] as List<dynamic>? ?? [];
    
    for (var query in queries) {
      final llmResults = query['llm_results'] as List<dynamic>? ?? [];
      chartItems.add(ChartDataItem(
        label: query['query']?.toString() ?? '',
        value: llmResults.length,
      ));
    }
    
    return chartItems;
  }
  
  /// 체크리스트 키를 사람이 읽기 쉬운 형태로 변환
  static String _formatChecklistKey(String key) {
    final Map<String, String> keyMapping = {
      'is_https': 'HTTPS 지원',
      'is_hsts': 'HSTS 보안',
      'has_faq_schema': 'FAQ 스키마',
      'has_author_schema': '저자 스키마',
      'has_profilepage_schema': '프로필 페이지 스키마',
      'has_publication_date': '발행일',
      'is_mobile_friendly': '모바일 친화적',
      'has_canonical_url': '표준 URL',
      'has_hreflang': '다국어 지원',
      'has_table_of_contents': '목차',
      'has_question_title': '질문형 제목',
      'has_list': '목록형 콘텐츠',
      'has_statistics': '통계 데이터',
      'has_robots_txt': 'Robots.txt',
      'has_meaningful_lists': '의미있는 목록',
      'has_meaningful_statistics': '의미있는 통계',
      'has_meaningful_citations': '의미있는 인용',
    };
    
    return keyMapping[key] ?? key;
  }
  
  /// 콘텐츠 품질 키를 사람이 읽기 쉬운 형태로 변환
  static String _formatContentQualityKey(String key) {
    final Map<String, String> keyMapping = {
      'lists': '목록형',
      'statistics': '통계값',
      'citations': '인용',
    };
    
    return keyMapping[key] ?? key;
  }
  
  /// 검색량을 버블 크기로 변환 (로그 스케일)
  static double _calculateBubbleSize(int volume) {
    if (volume <= 0) return 5.0;
    
    // 로그 스케일로 5~50 범위의 버블 크기 계산
    double logVolume = Math.log(volume) / Math.ln10;
    double minSize = 5.0;
    double maxSize = 50.0;
    double normalizedSize = ((logVolume - 2) / 3).clamp(0.0, 1.0);
    
    return minSize + (normalizedSize * (maxSize - minSize));
  }
}

/// 사용 예시 및 통합 파싱 클래스
class GeoDataProcessor {
  
  /// 모든 차트 데이터를 한번에 파싱
  static Map<String, dynamic> parseAllChartData(Map<String, dynamic> jsonData) {
    return {
      'keywords': DataParser.parseToChartData(jsonData),
      'schemas': DataParser.parseSchemaToChartData(jsonData),
      'queryResults': DataParser.parseQueryResultsToChartData(jsonData),
      'checklist': DataParser.parseToTableData(jsonData),
      'searchVolumes': DataParser.parseToBubbleData(jsonData),
      'keywordVolumes': DataParser.parseKeywordVolumeToBubbleData(jsonData),
      'contentQuality': DataParser.parseToDonutData(jsonData),
    };
  }
  
  /// ViewModel에서 사용할 수 있는 통합 메소드
  static Future<Map<String, dynamic>> processGeoApiResponse(String jsonString) async {
    try {
      final Map<String, dynamic> jsonData = json.decode(jsonString);
      return parseAllChartData(jsonData);
    } catch (e) {
      print('JSON 파싱 오류: $e');
      return {};
    }
  }
}

/// ViewModel에서 사용 예시
/*

*/