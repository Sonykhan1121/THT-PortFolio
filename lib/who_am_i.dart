import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:portfolio/home_tab_features/providers/home_providers.dart';
import 'package:portfolio/home_tab_features/views/job_info_card.dart';
import 'package:portfolio/home_tab_features/views/skilldisplaypage.dart';
import 'package:portfolio/personalinformationview.dart';
import 'package:provider/provider.dart';

import 'homepage.dart';

class WhoAmI extends StatefulWidget {
  const WhoAmI({super.key});

  @override
  State<WhoAmI> createState() => _WhoAmIState();
}

class _WhoAmIState extends State<WhoAmI> with SingleTickerProviderStateMixin {
  late TabController _who_am_i_tabcontroller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _who_am_i_tabcontroller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _who_am_i_tabcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProviders>(
      builder: (BuildContext context, HomeProviders homeProviders, Widget? child) {
      return Container(
        height: 800,
        child: Column(
          children: [
            TabBar(
              controller: _who_am_i_tabcontroller,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.orange,
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: EdgeInsets.symmetric(horizontal: 20),
              tabs: [
                Tab(
                  text: 'Personal Information',
                ),
                Tab(
                  text: 'My Experience',
                ),
                Tab(
                  text: 'My Skills',
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _who_am_i_tabcontroller,
                children: [
                  Personalinformationview(),
                  JobInfoDetails(),
                  SkillsDisplayPage(),
                ],
              ),
            ),
          ],
        ),
      );
    },

    );
  }
}
