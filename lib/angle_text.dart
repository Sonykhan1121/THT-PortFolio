import 'package:flutter/material.dart';

class AngleText extends StatelessWidget {
  const AngleText({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> menuItemTitles = [
      'UX Design',
      'App Design',
      'Dashboard',
      'Wireframe',
      'User Research',
      'UX Design',  // Duplicate entry - consider if this is intentional
      'App Design',  // Duplicate entry - consider if this is intentional
      'Dashboard',  // Duplicate entry - consider if this is intentional
    ];
    return Container(
      
      height: 50,

      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Color(0xFFFF6F00), Color(0xFFB621FE), Color(0xFF1A00B6)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            for (int i = 0; i < 8; i++) ...[
              MenuItem(title: menuItemTitles[i]),
            ],
          ],
        ),

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
      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      child: Text(title,
      style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
    );
  }
}

