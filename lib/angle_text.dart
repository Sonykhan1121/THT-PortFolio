import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class AngleText extends StatelessWidget {
  const AngleText({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> menuItemTitles = [
      'Flutter UI Design',
      'State Management',
      'Firebase Integration',
      'Responsive Layouts',
      'Custom Widgets',
      'API Integration',
      'Animations & Transitions',
      'Performance Optimization',
    ];

    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFFF6F00), Color(0xFFB621FE), Color(0xFF1A00B6)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Marquee(
        text: List.generate(24, (i) => menuItemTitles[i % 8]).join('   •   '),
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        scrollAxis: Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.center,
        blankSpace: 100.0,
        velocity: 50.0,
        // speed
        startPadding: 10.0,
        accelerationDuration: Duration(seconds: 1),
        accelerationCurve: Curves.linear,
        decelerationDuration: Duration(seconds: 1),
        decelerationCurve: Curves.easeOut,
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String title;

  const MenuItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Text(
        title,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
