import 'package:flutter/material.dart';
import 'package:geo/services/geo_api.dart';
import 'package:geo/ui/charts/donut_chart.dart';
import 'package:geo/ui/input_view.dart';
import 'package:geo/viewmodels/report_vm.dart';
import 'dart:ui';
import 'package:provider/provider.dart';
import 'package:geo/ui/report_view.dart';
import 'package:geo/viewmodels/input_vm.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => InputViewModel()),
      ChangeNotifierProvider(create: (_) => ReportViewModel(GeoApiService())),
    ],
    child: const MyApp(),
  ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const Color mainKeyColor = Color(0xFF2A62D7);

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
        colorScheme: ColorScheme.fromSeed(seedColor: mainKeyColor),
        primaryColor: mainKeyColor,
        scaffoldBackgroundColor: Color(0xFFF7F7F7),
      ),
      home:  InputView(),
    );
  }
}