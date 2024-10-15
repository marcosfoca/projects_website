import 'package:flutter/material.dart';
import 'package:marcos_portfolio/resources/pages/home_page.dart';
import 'package:marcos_portfolio/resources/pages/remind_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Marcos Fortis',
      home: HomePage(),
        routes: {
          '/homepage': (context) => const HomePage(),
          '/remindpage': (context) => const RemindPage(),
        }
    );
  }
}