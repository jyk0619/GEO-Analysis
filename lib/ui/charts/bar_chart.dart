import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';


//bar chart custom widget
class BarChartWidget extends StatelessWidget {
  final List<BarChartGroupData> barGroups;
  final double width;
  final double height;

  const BarChartWidget({
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
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: true, reservedSize: 40),
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
        ),
      ),
    );
  }
}