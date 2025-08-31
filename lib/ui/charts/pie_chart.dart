import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChartWidget extends StatefulWidget {
  final List<double> values;
  final List<String> labels;
  final double size;

  const PieChartWidget({
    super.key,
    required this.values,
    required this.labels,
    this.size = 200,
  });

  @override
  State<PieChartWidget> createState() => _PieChartWidgetState();
}

class _PieChartWidgetState extends State<PieChartWidget> {
  int touchedIndex = -1;

  final List<Color> colors = [
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.orange,
    Colors.purple,
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // 📊 차트
        SizedBox(
          width: widget.size,
          height: widget.size,
          child: PieChart(
            PieChartData(
              pieTouchData: PieTouchData(
                enabled: true,
                mouseCursorResolver: (event, response) =>
                SystemMouseCursors.click,
                touchCallback: (event, pieTouchResponse) {
                  setState(() {
                    if (!event.isInterestedForInteractions ||
                        pieTouchResponse == null ||
                        pieTouchResponse.touchedSection == null) {
                      touchedIndex = -1;
                      return;
                    }
                    touchedIndex =
                        pieTouchResponse.touchedSection!.touchedSectionIndex;
                  });
                },
              ),
              sections: _buildSections(),
              centerSpaceRadius: widget.size * 0.2,
              sectionsSpace: 2,
            ),
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOutCubic,
          ),
        ),

        const SizedBox(width: 20),

        // 🏷️ 범례
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(widget.values.length, (i) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: colors[i % colors.length],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(widget.labels[i]),
                ],
              ),
            );
          }),
        ),
      ],
    );
  }

  List<PieChartSectionData> _buildSections() {
    return List.generate(widget.values.length, (i) {
      final isTouched = i == touchedIndex;
      return PieChartSectionData(
        color: colors[i % colors.length],
        value: widget.values[i],
        radius: isTouched ? widget.size * 0.35 : widget.size * 0.3,
        title: '${widget.values[i]}%',
        titleStyle: TextStyle(
          fontSize: isTouched ? 18 : 14,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );
    });
  }
}
