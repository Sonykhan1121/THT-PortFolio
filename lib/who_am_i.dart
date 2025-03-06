import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:portfolio/personalinformationview.dart';

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
    return Container(
      height: 600,
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
                Column(
                  children: [
                    Image.asset(
                      'assets/experience.PNG',
                      height: 250,
                      width: 250,
                    ),
                    Center(
                      child: Text(
                        'I Only have 1.5 Month Experience',
                        style: TextStyle(color: Colors.orange, fontSize: 25),
                      ),
                    ),
                  ],
                ),
                Container(
                    padding: EdgeInsets.all(40.0),
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/my_skills.PNG",
                          height: 100,
                          width: 100,
                        ),
                        SizedBox(height: 20,),
                        Center(
                          child: Text(
                            'As a dedicated Computer Science Engineer specializing in Flutter development, I excel in crafting seamless and dynamic mobile applications tailored to meet user needs. My expertise extends through the full app lifecycle, from concept to deployment, ensuring robust and scalable solutions. With a strong foundation in problem-solving, I effectively tackle challenges and innovate with efficient algorithms and clean code, driving improvements in app functionality and user experience.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.orange,
                            ),
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
