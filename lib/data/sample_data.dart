

import 'package:flutter/material.dart';

import '../model/bubble_model.dart';

final List<Map<String, dynamic>> chartData = [
  {'label': 'Schema_1', 'value': 45},
  {'label': 'Schema_2', 'value': 25},
  {'label': 'Schema_3', 'value': 15},
  {'label': 'Schema_4', 'value': 5},
  {'label': 'Others', 'value': 10},
];

final bubbleData = [
  BubbleData(x: 0.2, y: 0.8, size: 20, color: Colors.blue, name: 'Flutter'),
  BubbleData(x: 0.4, y: 0.6, size: 30, color: Colors.green, name: 'Dart'),
  BubbleData(x: 0.6, y: 0.7, size: 35, color: Colors.orange, name: 'Widget'),
  BubbleData(x: 0.8, y: 0.5, size: 55, color: Colors.red, name: 'State'),
  BubbleData(x: 0.3, y: 0.4, size: 15, color: Colors.purple, name: 'Build'),
  BubbleData(x: 0.5, y: 0.3, size: 80, color: Colors.teal, name: 'Context'),
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