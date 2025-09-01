
import 'package:flutter/animation.dart';

class BubbleData {
  final double x; // x 좌표 (비율 0~1)
  final double y; // y 좌표 (비율 0~1)
  final double size; // 버블 크기 (반지름)
  final Color color;
  final String name; // 버블 이름

  BubbleData({
    required this.x,
    required this.y,
    required this.size,
    required this.color,
    required this.name

  });
}
