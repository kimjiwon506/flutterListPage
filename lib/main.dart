import 'package:flutter/material.dart';
import 'package:flutter_application_0612/pages/detail_page.dart';
import 'package:flutter_application_0612/pages/home_page.dart';
import 'package:flutter_application_0612/pages/navpages/main_page.dart';
import 'package:flutter_application_0612/pages/welcome_page.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(primaryColor: Colors.blue),
      home: const DetailPage(),
    );
  }
}
