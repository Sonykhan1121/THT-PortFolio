import 'package:flutter/material.dart';
import 'package:portfolio/homepage.dart';
import 'package:portfolio/portfolio_carousel.dart';
import 'package:portfolio/who_am_i.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}
