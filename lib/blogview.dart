import 'package:flutter/material.dart';
import 'package:portfolio/dashboardGrid.dart';
import 'package:portfolio/footer.dart';
import 'package:portfolio/homepage.dart';

import 'dashboarditem.dart';

class Blogview extends StatefulWidget {
  const Blogview({super.key});

  @override
  State<Blogview> createState() => _PortfolioviewState();
}

class _PortfolioviewState extends State<Blogview>
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
            fweight: 700, name: "Insights & Stories", c1: Colors.black),
        SizedBox(
          height: 30,
        ),
        TabBar(
          controller: _tabController,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.black,
          indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: Colors.orange),
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorPadding: EdgeInsets.symmetric(horizontal: 20),
          tabs: [
            Tab(
              text: 'All Blogs',
            ),
            Tab(
              text: 'UI/UX',
            ),
            Tab(
              text: "Website Development",
            ),
            Tab(
              text: 'App Development',
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
                    SizedBox(height: 50,),
                    Footer(),
                  ],
                ),
              ),
              Center(
                  child: Text(
                'UI/UX',
                style: TextStyle(fontSize: 35, color: Colors.orange),
              )),
              Center(
                  child: Text(
                'Website Development Contents',
                style: TextStyle(fontSize: 35, color: Colors.orange),
              )),
              Center(
                  child: Text(
                'App Development Contents',
                style: TextStyle(fontSize: 35, color: Colors.orange),
              )),
            ],
          ),
        )
      ],
    );
  }
}
