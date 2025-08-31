
import 'package:flutter/material.dart';
import 'package:geo/ui/charts/bubble_chart.dart';
import 'package:geo/ui/charts/donut_chart.dart';
import 'package:geo/ui/charts/horizontal_bar_chart.dart';
import 'package:geo/ui/charts/pie_chart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:geo/ui/charts/word_cloud.dart';
import 'charts/bar_chart.dart';

class ReportView extends StatelessWidget {
  const ReportView({super.key});

  @override
  Widget build(BuildContext context) {

    final words = [
      WordItem('Flutter', size: 32, color: Colors.blue),
      WordItem('Dart', size: 28, color: Colors.green),
      WordItem('Widget', size: 24, color: Colors.orange),
      WordItem('State', size: 20, color: Colors.red),
      WordItem('Build', size: 18, color: Colors.purple),
      WordItem('Context', size: 22, color: Colors.teal),
      WordItem('Layout', size: 26, color: Colors.brown),
      WordItem('Animation', size: 30, color: Colors.cyan),
      WordItem('Performance', size: 16, color: Colors.indigo),
      WordItem('Responsive', size: 14, color: Colors.lime),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('보고서 화면임'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: 1200,
                  minWidth: 800,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '보고서',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          Container(
                            width: 200,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text('입력한 도메인 . 의도'),
                            ),
                          ),
                          Container(
                            width: 200,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text('검색한 쿼리 개수'),
                            ),
                          ),
                          Container(
                            width: 200,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text('수집한 url 개수'),
                            ),
                          ),

                          Container(
                            width: 200,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text('분석 성공률'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                     padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: GridView(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 4/3,
                        ),

                        children: [
                          Container(
                            width: 400,
                            height: 300,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                Text('자주 쓰는 스키마'),
                                SizedBox(height: 10),
                                SizedBox(
                                  child: PieChartWidget(
                                    size: 150,
                                    values: [40, 30, 15, 10],
                                    labels: ['Schema A', 'Schema B', 'Schema C', 'Schema D'],
                                    //범례표시
                                  )
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            width: 400,
                            height: 300,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                Text('도넛 차트 예시'),
                                SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: DonutChart(
                                    radius: 75,
                                    strokeWidth: 15,
                                    total: 100,
                                    value: 85,
                                    child: Center(
                                      child: Text(
                                        '85%',
                                        style: TextStyle(
                                          fontSize: 24,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 400,
                            height: 300,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                Text('리스트/통계단위/인용 유무'),
                                SizedBox(
                                  width: 300,
                                  height: 200,
                                  child: BarChartWidget(
                                    barGroups: [
                                      BarChartGroupData(
                                        x: 0,
                                        barRods: [
                                          BarChartRodData(toY: 8, color: Colors.blue, width: 15),
                                        ],
                                      ),
                                      BarChartGroupData(
                                        x: 1,
                                        barRods: [
                                          BarChartRodData(toY: 10, color: Colors.red, width: 15),
                                        ],
                                      ),
                                      BarChartGroupData(
                                        x: 2,
                                        barRods: [
                                          BarChartRodData(toY: 14, color: Colors.green, width: 15),
                                        ],
                                      ),
                                      BarChartGroupData(
                                        x: 3,
                                        barRods: [
                                          BarChartRodData(toY: 15, color: Colors.yellow, width: 15),
                                        ],
                                      ),
                                    ],
                                    width: 300,
                                    height: 200,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 400,
                            height: 300,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                Text('체크리스트 통계'),
                                SizedBox(
                                  width: 300,
                                  height: 200,
                                  child:BarChartWidget(barGroups: [
                                    BarChartGroupData(
                                      x: 0,
                                      barRods: [
                                        BarChartRodData(toY: 8, color: Colors.blue, width: 15),
                                      ],
                                    ),
                                    BarChartGroupData(
                                      x: 1,
                                      barRods: [
                                        BarChartRodData(toY: 10, color: Colors.red, width: 15),
                                      ],
                                    ),
                                    BarChartGroupData(
                                      x: 2,
                                      barRods: [
                                        BarChartRodData(toY: 14, color: Colors.green, width: 15),
                                      ],
                                    ),
                                    BarChartGroupData(
                                      x: 3,
                                      barRods: [
                                        BarChartRodData(toY: 15, color: Colors.yellow, width: 15),
                                      ],
                                    ),
                                  ]
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            width: 400,
                            height: 300,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                Text('키워드 예시'),
                                SizedBox(height: 10,),
                                WordCloudWidget(
                                  words: words,
                                  width: 300,
                                  height: 200,
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            width: 400,
                            height: 300,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                Text('키워드 예시'),
                                SizedBox(height: 10,),
                                BubbleChartWidget(
                                  data: [
                                    BubbleData(x: 0.2, y: 0.3, size: 20, color: Colors.blue),
                                    BubbleData(x: 0.4, y: 0.5, size: 40, color: Colors.red),
                                    BubbleData(x: 0.6, y: 0.7, size: 25, color: Colors.green),
                                    BubbleData(x: 0.8, y: 0.4, size: 15, color: Colors.orange),
                                  ],
                                  width: 300,
                                  height: 200,
                                )
                              ],
                            ),
                          ),
                        ]
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ),
    );
  }
}
