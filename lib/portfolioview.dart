import 'package:flutter/material.dart';
import 'package:portfolio/dashboardGrid.dart';
import 'package:portfolio/homepage.dart';
import 'package:portfolio/lets_talk.dart';

import 'dashboarditem.dart';
import 'footer.dart';

class Portfolioview extends StatefulWidget {
  const Portfolioview({super.key});

  @override
  State<Portfolioview> createState() => _PortfolioviewState();
}

class _PortfolioviewState extends State<Portfolioview>
    with SingleTickerProviderStateMixin {
  final List<DashBoardItem> items = [
    DashBoardItem(
        title: "Smart Home Automation Panel",
        imageUrl: "assets/smart_panel.png"),
    DashBoardItem(
        title: "Intelligent Lighting Control",
        imageUrl: "assets/lighting_control.png"),
    DashBoardItem(
        title: "Advanced Security Dashboard",
        imageUrl: "assets/advance_security.png"),
    DashBoardItem(
        title: "Energy Consumption Tracker",
        imageUrl: "assets/energy_tracker.png"),
    DashBoardItem(
        title: "Climate Regulation System", imageUrl: "assets/climate.png"),
    DashBoardItem(
        title: "Multi-Room Audio Controller",
        imageUrl: "assets/audio_controller.png"),
  ];
  TabController? _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40,
        ),
        Usefullmethods.textWithColor_Size(
            fweight: 700, name: "See My Work’s", c1: Colors.black),
        SizedBox(
          height: 30,
        ),
        TabBar(
          controller: _tabController,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.black,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(30),

            color: Colors.orange
          ),
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorPadding: EdgeInsets.symmetric(horizontal: 20),
          tabs: [
            Tab(
              text: 'All Works',
            ),
            Tab(
              text: 'Desktop App',
            ),
            Tab(
              text: "Website Design",
            ),
            Tab(
              text: 'Mobile App',
            ),
          ],
        ),
        Expanded(

          child: TabBarView(
            controller: _tabController,
            children: [


              SingleChildScrollView(
                child: Column(
                  children: [
                    Dashboardgrid(items: items),
                    SizedBox(height: 70),
                    Usefullmethods.textWithColor_Size(
                      fweight: 700,
                      name: "Have any idea’s? let’s talk",
                      c1: Colors.black,
                      fSize: 38,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Usefullmethods.textWithColor_Size(
                      fweight: 400,
                      name: "Enter your email to start the conversation",
                      c1: Colors.black,
                      fSize: 16,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    LetsTalk(),
                    SizedBox(
                      height: 100,
                    ),
                    Footer(),
                  ],
                ),
              ),

              Center(child: Text('Desktop App Contents')),
              Center(child: Text('Website Design Content')),
              Center(child: Text('Mobile App Content')),
            ],
          ),
        )
      ],
    );
  }
}
