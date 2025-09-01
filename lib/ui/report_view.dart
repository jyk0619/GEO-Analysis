
import 'package:flutter/material.dart';
import 'package:geo/ui/charts/adv_donut_chart.dart';
import 'package:geo/ui/charts/bubble_chart.dart';
import 'package:geo/ui/charts/donut_chart.dart';
import 'package:geo/ui/charts/horizontal_bar_chart.dart';
import 'package:geo/ui/charts/pie_chart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:geo/ui/charts/word_cloud.dart';
import 'charts/bar_chart.dart';
import 'package:geo/data/sample_data.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class ReportView extends StatelessWidget {
  const ReportView({super.key});

  @override
  Widget build(BuildContext context) {

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
                     height: 1020,
                     padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: LayoutGrid(
                        areas: '''
                          a b
                          c b
                          c d
                        ''',
                        columnSizes: [
                          1.fr, 1.fr, // 가로는 동일 비율
                        ],
                        rowSizes: [
                          0.8.fr, 0.2.fr, 1.fr
                        ],
                        rowGap: 10,
                        columnGap: 10,
                        children: [
                          gridArea('a').containing(Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('자주 쓰는 키워드 통계'),
                                SizedBox(height: 10),
                                Expanded(
                                  child: BubbleChartWidget(
                                    data: bubbleData,
                                  ),
                                ),
                              ],
                            ),
                          )),
                          gridArea('b').containing(Container(color: Colors.blueAccent,),),
                          gridArea('c').containing(Container(color: Colors.greenAccent,),),
                          gridArea('d').containing(Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('자주 쓰이는 스키마 통계'),
                                SizedBox(height: 10),
                                Expanded(
                                  child: SyncDonutChartWidget(
                                    centerTitle: '스키마',
                                    data: chartData,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ),
                        ],
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
