import 'package:flutter/material.dart';
import 'package:geo/ui/charts/donut_chart.dart';
import 'package:geo/ui/input_view.dart';
import 'dart:ui';

import 'package:geo/ui/report_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior: MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown
        },
      ),

      theme: ThemeData(
        fontFamily: 'AppleSDGothicNeo',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home:  ReportView(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('테스트 화면임'),
      ),
      body: Wrap(
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: Center(
              child: DonutChart(
                radius: 50,
                strokeWidth: 10,
                  total: 100,
                  value: 85,
              child: Center(
                child: Text('85%'),
              )
              ),
            ),
          ),
        ],
      ),
    );
  }
}
