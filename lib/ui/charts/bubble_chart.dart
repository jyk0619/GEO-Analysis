import 'package:flutter/material.dart';

class BubbleChartWidget extends StatelessWidget {
  final List<BubbleData> data;
  final double width;
  final double height;

  const BubbleChartWidget({
    Key? key,
    required this.data,
    this.width = 300,
    this.height = 300,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, height),
      painter: BubbleChartPainter(data),
    );
  }
}

class BubbleData {
  final double x; // x 좌표 (비율 0~1)
  final double y; // y 좌표 (비율 0~1)
  final double size; // 버블 크기 (반지름)
  final Color color;

  BubbleData({
    required this.x,
    required this.y,
    required this.size,
    required this.color,
  });
}

class BubbleChartPainter extends CustomPainter {
  final List<BubbleData> data;

  BubbleChartPainter(this.data);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    for (var bubble in data) {
      paint.color = bubble.color.withOpacity(0.6);
      final offset = Offset(bubble.x * size.width, size.height - bubble.y * size.height);

      canvas.drawCircle(offset, bubble.size, paint);

      // 옵션: 버블 테두리
      paint
        ..color = bubble.color
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2;
      canvas.drawCircle(offset, bubble.size, paint);
      paint.style = PaintingStyle.fill;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
