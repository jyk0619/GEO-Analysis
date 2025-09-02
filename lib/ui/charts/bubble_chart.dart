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

  final List<Offset> fixedPositions = [
    Offset(0.4, 0.45),
    Offset(0.6, 0.65),
    Offset(0.75, 0.45),
    Offset(0.6, 0.35),
    Offset(0.7, 0.75),
  ];

  final List<Color> fixedColors = [
    Color(0xFF2A62D7),
    Color(0xFF454545),
    Color(0xFF737373),
    Color(0xFF9A9A9A),
    Color(0xFFB5B5B5),
    Color(0xFFCFCFCF),
  ];

  BubbleChartPainter(this.data);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    for (int i = 0; i < data.length; i++) {
      final bubble = data[i];

      final pos = fixedPositions[i % fixedPositions.length];
      final offset = Offset(pos.dx * size.width, size.height - pos.dy * size.height);

      final color = fixedColors[i % fixedColors.length];
      paint.color = color;

      canvas.drawCircle(offset, bubble.size*1.5, paint);

      paint
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1;
      canvas.drawCircle(offset, bubble.size*1.2, paint);
      paint.style = PaintingStyle.fill;

      final textSpan = TextSpan(
        text: '${bubble.name}\n${bubble.size}%',
        style: TextStyle(
          color: Colors.white,
          fontSize: bubble.size / 2,
          fontWeight: FontWeight.bold,
          fontFamily: 'MetroSans',
        ),
      );

      final textPainter = TextPainter(
        text: textSpan,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      );

      textPainter.layout(
        minWidth: 0,
        maxWidth: bubble.size * 2,
      );

      final textOffset = offset - Offset(textPainter.width / 2, textPainter.height / 2);
      textPainter.paint(canvas, textOffset);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
