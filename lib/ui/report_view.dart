
import 'package:flutter/material.dart';
import 'package:geo/ui/animations/countup.dart';
import 'package:geo/ui/charts/adv_donut_chart.dart';
import 'package:geo/ui/charts/bubble_chart.dart';
import 'package:geo/ui/charts/donut_chart.dart';
import 'package:geo/data/sample_data.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:provider/provider.dart';
import 'charts/customtable.dart';
import 'package:geo/viewmodels/report_vm.dart';



class ReportView extends StatelessWidget {
  const ReportView({super.key});

  @override
  Widget build(BuildContext context) {
    final reportViewModel = Provider.of<ReportViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF7F7F7),
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
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(10),
                      child: Row(
                        spacing: 10,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              height: 120,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
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
                                          Text('쇼핑', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, ),),
                                          Container(width: 1, height: 18,color: Colors.grey, margin: EdgeInsets.symmetric(horizontal: 20),),
                                          Text('비교', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, )),
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
                              height: 120,
                              decoration: BoxDecoration(
                                color: Colors.white,
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
                                      child: Align(
                                          alignment: Alignment.centerRight,
                                          child: CountUpText(fractionDigits: 0, end: 50, suffix:'개' ,style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),)),
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
                              height: 120,
                              decoration: BoxDecoration(
                                color: Colors.white,

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
                                          CountUpText(fractionDigits:0,end: 1200, suffix:'개' ,style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),
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
                              height: 120,
                              decoration: BoxDecoration(
                                color: Colors.white,
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
                                         CountUpText(end: 98, suffix:'%' ,style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),)],
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
                          a d
                          c d
                          c d
                        ''',
                        columnSizes: [
                          1.fr, 1.fr, // 가로는 동일 비율
                        ],
                        rowSizes: [
                          0.6.fr, 0.2.fr, 0.2.fr, 0.8.fr
                        ],
                        rowGap: 10,
                        columnGap: 10,
                        children: [
                          gridArea('a').containing(Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('자주 쓰는 키워드 통계'),
                                SizedBox(height: 20),
                                Expanded(
                                  child: BubbleChartWithLegend(
                                    data: reportViewModel.keywordBubbleData,
                                    //bubbleData,
                                  ),
                                ),
                              ],
                            ),
                          )),
                          gridArea('b').containing(Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.white,

                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('자주 쓰이는 테이블 통계'),
                                SizedBox(height: 15),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: reportViewModel.donutChartData.map((item) {
                                      return Container(
                                        width: 220,
                                        height: 220,
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(color: Colors.grey.shade300),
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            SizedBox(height: 10),
                                            Text(item.title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                                            SizedBox(height: 50),
                                            SizedBox(
                                              width: 150,
                                              child: DonutChart(
                                                radius: 70,
                                                strokeWidth: 5,
                                                total: 100,
                                                value: item.value,
                                                child: Center(
                                                  child: Column(
                                                    children: [
                                                      CountUpText(end: item.value, suffix:'%' ,style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold, fontFamily: 'MetroSans'),),
                                                      Text('${item.current} / ${item.total}', style: TextStyle(fontSize: 14, fontFamily: 'MetroSans')),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 20)
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                  ],
                                ),
                              ],
                            ),
                          ),),
                          gridArea('c').containing(Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: SizedBox(
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('주요 체크리스트'),
                                  SizedBox(height: 10),
                                  Divider(color: Theme.of(context).primaryColor,),
                                  Expanded(
                                    child: SingleChildScrollView(
                                        child: ReportTable(tableItems: reportViewModel.checklistTableData))
                                  )
                                ],
                              ),
                            ),
                          )),
                          gridArea('d').containing(Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('자주 쓰이는 스키마 통계'),
                                SizedBox(height: 15),
                                Expanded(
                                  child: SyncDonutChartWidget(
                                    centerTitle: '스키마',
                                    data: reportViewModel.schemaChartData.map((item) => {'label': item.label, 'value': item.value}).toList(),
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
                        color: Colors.white,

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

    return SizedBox(
      height: 260, // 전체 높이 고정
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20), // 버튼 공간 확보
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
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisExtent: 120,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: pageItems.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('검색한 쿼리'),
                                  SizedBox(height: 10),
                                  Text('검색한 쿼리${[index]}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                          padding: EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius: BorderRadius.circular(4)
                                          ),
                                          child: Image.asset('assets/images/perplexity.png', width: 15, height: 15,)),
                                      SizedBox(width: 5),
                                      Card(
                                        color: Colors.blue.shade50,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
                                          child: Text('+5 References', style: TextStyle(fontSize: 12, color: Theme.of(context).primaryColor),),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.arrow_forward_ios, color: Theme.of(context).primaryColor,),
                              onPressed: () {

                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        currentPage<=0
            ?SizedBox()
            :Positioned(
        left: 0,
        top: 0,
        bottom: 40,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 4,
                offset: Offset(2, 0),
              ),
            ],
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: Icon(Icons.arrow_back, color: Theme.of(context).primaryColor,),
            onPressed: currentPage > 0
                ? () {
              _pageController.previousPage(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
              );
            }
                : null,
          ),
        ),
      ),
        currentPage>=totalPages-1
            ?SizedBox()
            :
      Positioned(
        right: 0,
        top: 0,
        bottom: 40,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 4,
                offset: Offset(2, 0),
              ),
            ],
          ),
          child: IconButton(
            icon: Icon(Icons.arrow_forward, color: Theme.of(context).primaryColor,),
            onPressed: currentPage < totalPages - 1
                ? () {
              _pageController.nextPage(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
              );
            }
                : null,
          ),
        ),
      ),

        ],
      ),
    );
  }
}
