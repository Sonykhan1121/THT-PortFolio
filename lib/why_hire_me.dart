import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'homepage.dart';

class WhyHireMe extends StatefulWidget {
  const WhyHireMe({super.key});

  @override
  State<WhyHireMe> createState() => _WhyHireMeState();
}

class _WhyHireMeState extends State<WhyHireMe> {
  @override
  Widget build(BuildContext context) {
    // Get screen width to make responsive layout decisions
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 768;

    return Center(
      child: Container(
        padding: EdgeInsets.all(20),
        constraints: BoxConstraints(maxWidth: 1200), // Constrain max width for large screens
        child: isMobile
            ? _buildMobileLayout()
            : _buildDesktopLayout(),
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Container(
            height: 350,
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), // Optional: rounded corners
              image: DecorationImage(
                image: AssetImage('assets/profile.PNG'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(width: 20), // Add spacing between image and text
        Expanded(
          flex: 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _buildContentWidgets(),
          ),
        )
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 250,
          width: double.infinity,
          margin: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), // Optional: rounded corners
            image: DecorationImage(
              image: AssetImage('assets/profile.PNG'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 20),
        ..._buildContentWidgets(), // Use spread operator to include all widgets from the list
      ],
    );
  }

  List<Widget> _buildContentWidgets() {
    return [
      Text(
        'A Commitment to Quality and Creativity',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20, // Increased font size for heading
        ),
      ),
      SizedBox(height: 12),
      Text(
        "I thrive on collaboration within agile teams, adapt quickly to new technologies and challenges, and am committed to continuous learning to stay ahead in the ever-evolving software engineering industry. I am proficient in [list key technologies, e.g., Java, Python, Flutter, React, AWS, Docker, Kubernetes] and am always eager to expand my skillset. Choosing me means choosing a dedicated and results-oriented engineer who genuinely cares about turning your vision into a high-quality, maintainable, and performant product.",
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16,
          height: 1.5, // Improve line height for better readability
        ),
      ),
      SizedBox(height: 25),
      MouseRegion(
        cursor: SystemMouseCursors.click, // Change cursor to pointer on hover
        child: GestureDetector(
          onTap: () {
            // Add your hire me action here
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10), // Slightly increased padding
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.orange,
              boxShadow: [BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                offset: Offset(0, 2),
              )], // Add subtle shadow for web
            ),
            child: Usefullmethods.textWithColor_Size(
              fweight: 700,
              name: "Hire Me",
              c1: Colors.white,
            ),
          ),
        ),
      ),
    ];
  }
}

class IconText extends StatelessWidget {
  final IconData iconData;
  final String text;
  const IconText({super.key, required this.iconData, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(iconData, size: 20),
        SizedBox(width: 10),
        Text(text),
      ],
    );
  }
}