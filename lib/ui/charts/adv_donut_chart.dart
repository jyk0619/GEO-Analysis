import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SyncDonutChartWidget extends StatelessWidget {
  final String centerTitle;
  final List<Map<String, dynamic>> data;
  final String innerRadius;
  final String radius;

  static const List<Color> fixedColors = [
    Color(0xFF2A62D7),
    Color(0xFF454545),
    Color(0xFF737373),
    Color(0xFF9A9A9A),
    Color(0xFFB5B5B5),
    Color(0xFFCFCFCF),
  ];

  // 좌우 반전 여부 옵션
  final bool reverseOrder;
  final int startAngle;

  const SyncDonutChartWidget({
    Key? key,
    required this.centerTitle,
    required this.data,
    this.innerRadius = '70%',
    this.radius = '70%',
    this.reverseOrder = false,
    this.startAngle = 0, // 기본값 0도
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final displayData =
    reverseOrder ? data.reversed.toList() : data; // 순서 뒤집기

    return Stack(
      alignment: Alignment.center,
      children: [
        SfCircularChart(
          annotations: [
            CircularChartAnnotation(
              widget: Text(
                centerTitle,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
          series: <CircularSeries>[
            DoughnutSeries<Map<String, dynamic>, String>(
              dataSource: displayData,
              xValueMapper: (datum, _) => datum['label'],
              yValueMapper: (datum, _) => datum['value'],
              pointColorMapper: (datum, index) =>
              fixedColors[index! % fixedColors.length],
              dataLabelMapper: (datum, _) =>
              '${datum['value']}% \n ${datum['label']}',
              dataLabelSettings: DataLabelSettings(
                isVisible: true,
                labelPosition: ChartDataLabelPosition.outside,
                labelAlignment: ChartDataLabelAlignment.bottom,                connectorLineSettings: const ConnectorLineSettings(
                  type: ConnectorType.line,
                  length: '30%',
                  width: 1,
                ),
              ),
              innerRadius: innerRadius,
              radius: radius,
              startAngle: startAngle, // 시작 위치 조정
            ),
          ],
          legend: Legend(isVisible: false),
        ),
      ],
    );
  }
}
