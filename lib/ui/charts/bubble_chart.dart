import 'package:flutter/material.dart';
import 'package:geo/model/bubble_model.dart';

class BubbleChartWidget extends StatelessWidget {
  final List<BubbleData> data;
  final double width;
  final double height;

  const BubbleChartWidget({
    Key? key,
    required this.data,
    this.width = double.infinity,
    this.height = double.infinity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, height),
      painter: BubbleChartPainter(data),
    );
  }
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
        ..strokeWidth = 0;
      canvas.drawCircle(offset, bubble.size, paint);
      paint.style = PaintingStyle.fill;


      // 텍스트 그리기 (이름과 값)
      final textSpan = TextSpan(
        text: '${bubble.name}\n${bubble.size}%',
        style: TextStyle(
          color: Colors.white,
          fontSize: bubble.size / 3, // 크기는 버블 크기에 따라 조절
          fontWeight: FontWeight.bold,
          fontFamily: 'MetroSans'
        ),
      );

      final textPainter = TextPainter(
        text: textSpan,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      );

      textPainter.layout(
        minWidth: 0,
        maxWidth: bubble.size * 2, // 버블 크기 내에서 줄바꿈 가능
      );

      final textOffset = offset - Offset(textPainter.width / 2, textPainter.height / 2);
      textPainter.paint(canvas, textOffset);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
