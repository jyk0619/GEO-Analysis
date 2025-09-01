import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SyncDonutChartWidget extends StatelessWidget {
  final String centerTitle; // 차트 중앙 텍스트
  final List<Map<String, dynamic>> data;
  final String innerRadius;
  final String radius;


  const SyncDonutChartWidget({
    Key? key,
    required this.centerTitle,
    required this.data,
    this.innerRadius = '70%',
    this.radius = '70%',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center, // 중앙 정렬
      children: [
        SfCircularChart(
          borderColor: Colors.black12,
          borderWidth: 1,
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
                dataSource: data,
                xValueMapper: (datum, _) => datum['label'],
                yValueMapper: (datum, _) => datum['value'],
                dataLabelMapper: (datum, _) => '${datum['value']}% \n ${datum['label']}',
                dataLabelSettings: DataLabelSettings(
                    isVisible: true,
                    textStyle: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'MetroSans',
                    ),
                    // Positioning the data label
                    labelPosition: ChartDataLabelPosition.outside,
                    connectorLineSettings: const ConnectorLineSettings(
                      type: ConnectorType.line,
                      length: '30%',
                      width: 1,
                    )
                ),
                innerRadius: innerRadius,
                radius: '70%'
            ),
          ],
          legend: Legend(
            isVisible: false,
            borderColor: Colors.black,
            borderWidth: 1,
            offset: Offset(0, 100),
            width: '10%',
            padding: 10,
            itemPadding: 10,
            textStyle: TextStyle(fontSize: 12),
            position: LegendPosition.bottom,
            alignment: ChartAlignment.values[0], // ChartAlignment.near
            overflowMode: LegendItemOverflowMode.wrap,
          ),
        ),
      ],
    );
  }
}
