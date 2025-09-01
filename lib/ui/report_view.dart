
import 'package:flutter/material.dart';
import 'package:geo/ui/charts/adv_donut_chart.dart';
import 'package:geo/ui/charts/bubble_chart.dart';
import 'package:geo/ui/charts/donut_chart.dart';
import 'package:geo/ui/charts/horizontal_bar_chart.dart';
import 'package:geo/ui/charts/pie_chart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:geo/ui/charts/word_cloud.dart';
import '../model/table_model.dart';
import 'charts/bar_chart.dart';
import 'package:geo/data/sample_data.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

import 'charts/customtable.dart';

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
                  maxWidth: 1440,
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
                      child: Row(
                        spacing: 10,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              height: 100,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.search, color: Theme.of(context).primaryColor,),
                                        SizedBox(width: 5,),
                                        Text('도메인 | 의도', style: TextStyle(fontSize: 16, color: Theme.of(context).primaryColor),),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    SizedBox(
                                      height: 44,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text('쇼핑', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, ),),
                                          Container(width: 1, height: 18,color: Colors.grey, margin: EdgeInsets.symmetric(horizontal: 20),),
                                          Text('비교', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, )),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.all(10),
                              height: 100,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.discount, color: Theme.of(context).primaryColor,),
                                        SizedBox(width: 5,),
                                        Text('검색한 쿼리 개수', style: TextStyle(fontSize: 16, color: Theme.of(context).primaryColor),),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    SizedBox(
                                      height: 44,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text('50 개', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, ),),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.all(10),
                              height: 100,
                              decoration: BoxDecoration(

                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child:Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.link, color: Theme.of(context).primaryColor,),
                                        SizedBox(width: 5,),
                                        Text('분석한 url 수', style: TextStyle(fontSize: 16, color: Theme.of(context).primaryColor),),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    SizedBox(
                                      height: 44,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text('1,200 개', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, ),),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.all(10),
                              height: 100,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.incomplete_circle, color: Theme.of(context).primaryColor,),
                                        SizedBox(width: 5,),
                                        Text('분석 성공율', style: TextStyle(fontSize: 16, color: Theme.of(context).primaryColor),),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    SizedBox(
                                      height: 44,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text('100 %', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, ),),

                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
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
                          gridArea('b').containing(Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('자주 쓰이는 테이블 통계'),
                                SizedBox(height: 10),
                                Expanded(
                                  child: SizedBox(width: double.infinity,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 50,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: donutChartItems.map((item) {
                                        return SizedBox(
                                          width: 180,
                                          child: Column(
                                            children: [
                                              Text(item.title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                              SizedBox(height: 80),
                                              DonutChart(
                                                radius: 70,
                                                strokeWidth: 20,
                                                total: 100,
                                                value: item.value,
                                                child: Center(
                                                  child: Column(
                                                    children: [
                                                      Text('${item.value}%', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'MetroSans', color: Theme.of(context).primaryColor)),
                                                      Text('${item.current} / ${item.total}', style: TextStyle(fontSize: 14, fontFamily: 'MetroSans')),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                    ],
                                  )),
                                  ),
                              ],
                            ),
                          ),),
                          gridArea('c').containing(Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: SizedBox(
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('주요 체크리스트'),
                                  SizedBox(height: 10),
                                  Divider(color: Colors.blueAccent),
                                  Expanded(
                                    child: ReportTable(tableItems: tableItems)
                                  )
                                ],
                              ),
                            ),
                          )),
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
                                    data: chartData.map((item) => {'label': item.label, 'value': item.value}).toList(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('검색한 쿼리 표시', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                          SizedBox(height: 10),
                          SizedBox(child: CardPager(items: List.generate(20, (index) => '카드 아이템 ${index + 1}'))),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(10),
                      child: Text('ⓒ 2025 중꺾마 Corp. All rights reserved.', textAlign: TextAlign.center, style: TextStyle(color: Colors.grey),),
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

class CardPager extends StatefulWidget {
  final List<String> items; // 카드 데이터

  const CardPager({super.key, required this.items});

  @override
  State<CardPager> createState() => _CardPagerState();
}

class _CardPagerState extends State<CardPager> {
  late final PageController _pageController;
  int currentPage = 0;
  final int itemsPerPage = 6;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final totalPages = (widget.items.length / itemsPerPage).ceil();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // 왼쪽 버튼
        IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: currentPage > 0
              ? () {
            _pageController.previousPage(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
            );
          }
              : null,
        ),

        // 페이지 뷰 (카드들)
        Expanded(
          child: SizedBox(
            height: 260, // 카드 두 줄 높이
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() => currentPage = index);
              },
              itemCount: totalPages,
              itemBuilder: (context, pageIndex) {
                final pageItems = widget.items
                    .skip(pageIndex * itemsPerPage)
                    .take(itemsPerPage)
                    .toList();

                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // 가로 3개
                    mainAxisExtent: 120, // 카드 높이
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: pageItems.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.blue[100],
                      child: Center(
                        child: Text(pageItems[index]),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),

        // 오른쪽 버튼
        IconButton(
          icon: const Icon(Icons.arrow_forward_ios),
          onPressed: currentPage < totalPages - 1
              ? () {
            _pageController.nextPage(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
            );
          }
              : null,
        ),
      ],
    );
  }
}
