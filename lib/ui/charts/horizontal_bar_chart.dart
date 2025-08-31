import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class HorizontalBarChartWidget extends StatelessWidget {
  final List<BarChartGroupData> barGroups;
  final double width;
  final double height;

  const HorizontalBarChartWidget({
    super.key,
    required this.barGroups,
    this.width = 200,
    this.height = 100,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: BarChart(
        BarChartData(
          barGroups: barGroups,
          borderData: FlBorderData(show: false),
          rotationQuarterTurns: 1, // ★ 가로형으로 회전
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: true, reservedSize: 50),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: true, reservedSize: 30),
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
          ),
          gridData: FlGridData(show: false),
          alignment: BarChartAlignment.spaceEvenly,
          groupsSpace: 12,
        ),
      ),
    );
  }
}
