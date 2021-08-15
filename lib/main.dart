import 'package:flutter/material.dart';
import 'package:flutter_yin_demo/config/app_theme.dart';
import 'package:flutter_yin_demo/transit_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '音悦台',
      theme: themeData,
      home: TransitPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
