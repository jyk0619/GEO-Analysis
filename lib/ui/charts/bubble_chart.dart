import 'package:flutter/material.dart';
import 'package:geo/model/bubble_model.dart';

class BubbleChartWidget extends StatefulWidget {
  final List<BubbleData> data;
  final double width;
  final double height;
  final Duration duration;

  const BubbleChartWidget({
    Key? key,
    required this.data,
    this.width = double.infinity,
    this.height = double.infinity,
    this.duration = const Duration(milliseconds: 800),
  }) : super(key: key);

  @override
  State<BubbleChartWidget> createState() => _BubbleChartWidgetState();
}

class _BubbleChartWidgetState extends State<BubbleChartWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation; // 0.0 ~ 1.0로 크기 조정

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) => CustomPaint(
        size: Size(widget.width, widget.height),
        painter: BubbleChartPainter(widget.data, _animation.value),
      ),
    );
  }
}

// BubbleChartPainter에 애니메이션 비율 인자 추가
class BubbleChartPainter extends CustomPainter {
  final List<BubbleData> data;
  final double animValue;

  final List<Offset> fixedPositions = [
    Offset(0.1, 0.45),
    Offset(0.4, 0.8),
    Offset(0.7, 0.8),
    Offset(0.65, 0.4),
    Offset(0.95, 0.5),
  ];

  final List<Color> fixedColors = [
    Color(0xFF2A62D7),
    Color(0xFF454545),
    Color(0xFF737373),
    Color(0xFF9A9A9A),
    Color(0xFFB5B5B5),
    Color(0xFFCFCFCF),
  ];

  BubbleChartPainter(this.data, this.animValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    for (int i = 0; i < data.length; i++) {
      final bubble = data[i];
      final bubbleSize = bubble.size * 15;
      final pos = fixedPositions[i % fixedPositions.length];
      final offset = Offset(pos.dx * size.width, size.height - pos.dy * size.height);
      final color = fixedColors[i % fixedColors.length];
      paint.color = color;

      // 버블 크기 애니메이션
      final bubbleRadius = bubbleSize * 1.5 * animValue;
      final strokeRadius = bubbleSize * 1.2 * animValue;

      canvas.drawCircle(offset, bubbleRadius, paint);

      paint
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1;
      canvas.drawCircle(offset, strokeRadius, paint);
      paint.style = PaintingStyle.fill;

      final textSpan = animValue > 0.8
          ? TextSpan(
        children: [
          TextSpan(
            text: '${bubble.name}\n',
            style: TextStyle(
              color: Colors.white,
              fontSize: bubbleSize / 3.5 * animValue, // 이름 크기
              fontFamily: 'MetroSans',
            ),
          ),
          TextSpan(
            text: '${bubble.size.toStringAsFixed(2)}%',
            style: TextStyle(
              color: Colors.white,
              fontSize: bubbleSize / 1.8 * animValue, // % 크기 다르게
              fontFamily: 'MetroSans',
              letterSpacing: 0,
            ),
          ),
        ],
      )
          : const TextSpan(text: "");


      final textPainter = TextPainter(
        text: textSpan,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      );

      textPainter.layout(
        minWidth: 0,
        maxWidth: bubbleSize * 2 * animValue,
      );

      final textOffset = offset - Offset(textPainter.width / 2, textPainter.height / 2);
      textPainter.paint(canvas, textOffset);
    }
  }

  @override
  bool shouldRepaint(covariant BubbleChartPainter oldDelegate) => oldDelegate.animValue != animValue;
}


class BubbleChartLegend extends StatelessWidget {
  final List<BubbleData> data;
  final List<Color> colors;

  const BubbleChartLegend({
    Key? key,
    required this.data,
    required this.colors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(data.length, (index) {
        final bubble = data[index];
        final color = colors[index % colors.length];
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: color,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              bubble.name,
              style: const TextStyle(fontSize: 12),
            ),
          ],
        );
      }),
    );
  }
}

class BubbleChartWithLegend extends StatelessWidget {
  final List<BubbleData> data;
  final double width;
  final double height;

  // fixedColors를 공유하여 색상 일치 보장
  static const List<Color> fixedColors = [
    Color(0xFF2A62D7),
    Color(0xFF454545),
    Color(0xFF737373),
    Color(0xFF9A9A9A),
    Color(0xFFB5B5B5),
    Color(0xFFCFCFCF),
  ];

  const BubbleChartWithLegend({
    Key? key,
    required this.data,
    this.width = 400,
    this.height = 300,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: width,
          height: height,
          child: BubbleChartWidget(
            data: data,
            width: width,
            height: height,
          ),
        ),
        const SizedBox(height: 10),
        BubbleChartLegend(
          data: data,
          colors: fixedColors,
        ),
      ],
    );
  }
}
