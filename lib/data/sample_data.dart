

import 'package:flutter/material.dart';

import '../model/bubble_model.dart';
import '../model/donut_model.dart';
import '../model/schema_model.dart';
import '../model/table_model.dart';

final List<ChartDataItem> chartData = [
  ChartDataItem(label: 'Schema_1', value: 45),
  ChartDataItem(label: 'Schema_2', value: 25),
  ChartDataItem(label: 'Schema_3', value: 15),
  ChartDataItem(label: 'Schema_4', value: 5),
  ChartDataItem(label: 'Others', value: 10),
];


final bubbleData = [
  BubbleData(size: 80, name: 'Context'),
  BubbleData(size: 30,  name: 'Dart'),
  BubbleData(size: 20, name: 'Widget'),
  BubbleData(size: 55,name: 'State'),
  BubbleData(size: 15,name: 'Build'),

];

final List<TableItem> tableItems = [
  TableItem(name: 'https', trueCount: '4', total: '45', truePercentage: '45%'),
  TableItem(name: 'hsts', trueCount: '25', total: '45', truePercentage: '45%'),
  TableItem(name: 'robots_txt_exists', trueCount: '15', total: '45', truePercentage: '55%'),
  TableItem(name: 'sitemap_has_lastmod', trueCount: '5', total: '45', truePercentage: '45%'),
  TableItem(name: 'has_faq_schema', trueCount: '10', total: '45', truePercentage: '45%'),
  TableItem(name: 'has_author_schema', trueCount: '10', total: '45', truePercentage: '45%'),
  TableItem(name: 'has_profilepage_schema', trueCount: '10', total: '45', truePercentage: '45%'),
  TableItem(name: 'has_publication_date', trueCount: '10', total: '45', truePercentage: '45%'),
  TableItem(name: 'mobile_friendly', trueCount: '10', total: '45', truePercentage: '75%'),
  TableItem(name: 'has_canocial', trueCount: '10', total: '45', truePercentage: '45%'),
  TableItem(name: 'has_hreflang', trueCount: '10', total: '45', truePercentage: '45%'),
  TableItem(name: 'has_toc', trueCount: '10', total: '45', truePercentage: '45%'),
  TableItem(name: 'has_longtail_or_question', trueCount: '10', total: '45', truePercentage: '45%'),
  TableItem(name: 'page_fetched', trueCount: '10', total: '45', truePercentage: '45%'),
];

final List<DonutChartItem> donutChartItems = [
  DonutChartItem(title: '목록형', value: 30, current: 720, total: 1200),
  DonutChartItem(title: '통계값', value: 50, current: 600, total: 1200),
  DonutChartItem(title: '인용', value: 80, current: 960, total: 1200),
];



// 워드 클라우드 샘플 데이터
// final words = [
//   WordItem('Flutter', size: 32, color: Colors.blue),
//   WordItem('Dart', size: 28, color: Colors.green),
//   WordItem('Widget', size: 24, color: Colors.orange),
//   WordItem('State', size: 20, color: Colors.red),
//   WordItem('Build', size: 18, color: Colors.purple),
//   WordItem('Context', size: 22, color: Colors.teal),
//   WordItem('Layout', size: 26, color: Colors.brown),
//   WordItem('Animation', size: 30, color: Colors.cyan),
//   WordItem('Performance', size: 16, color: Colors.indigo),
//   WordItem('Responsive', size: 14, color: Colors.lime),
// ];