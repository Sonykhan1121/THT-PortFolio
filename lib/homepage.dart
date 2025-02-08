import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:portfolio/dashboardGrid.dart';
import 'package:portfolio/portfolio_carousel.dart';
import 'package:portfolio/who_am_i.dart';
import 'package:portfolio/dashboarditem.dart';
import 'package:portfolio/why_hire_me.dart';


class Homepage extends StatefulWidget {

   Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<DashBoardItem> items = [
    DashBoardItem(title: "Smart Home Automation Panel", imageUrl: "assets/smart_panel.png"),
    DashBoardItem(title: "Intelligent Lighting Control", imageUrl: "assets/lighting_control.png"),
    DashBoardItem(title: "Advanced Security Dashboard", imageUrl: "assets/advance_security.png"),
    DashBoardItem(title: "Energy Consumption Tracker", imageUrl: "assets/energy_tracker.png"),
    DashBoardItem(title: "Climate Regulation System", imageUrl: "assets/climate.png"),
    DashBoardItem(title: "Multi-Room Audio Controller", imageUrl: "assets/audio_controller.png"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'AppBar',
            style: TextStyle(
              color: Color(0xFF7626FF),
            ),
          ),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: ForGradientColor_boxde(
                Color(0x405E00FB), Color(0x33FF9900), 0, 2),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
                decoration: ForGradientColor_boxde(
                    Color(0x405E00FB), Color(0x33FF9900), 0, 2),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        textWithColor_Size(
                            name: "Home",
                            c1: Color(0xFFFF9D00),
                            fSize: 16,
                            fweight: 700),
                        textWithColor_Size(
                            name: "Portfolio",
                            c1: Colors.black,
                            fSize: 16,
                            fweight: 400),
                        textWithColor_Size(
                            name: "Blog",
                            c1: Colors.black,
                            fSize: 16,
                            fweight: 400),
                        textWithColor_Size(
                            name: "Contact",
                            c1: Colors.black,
                            fSize: 16,
                            fweight: 400),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Column(
                      children: [
                        textWithColor_Size(
                            name: "Hello",
                            c1: Colors.black,
                            fSize: 30,
                            fweight: 400),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            textWithColor_Size(
                                name: "I'm ",
                                c1: Colors.black,
                                fSize: 30,
                                fweight: 400),
                            textWithColor_Size(
                                name: "Sony khan",
                                c1: Color(0xFFFF9D00),
                                fSize: 30,
                                fweight: 700),
                          ],
                        ),
                        ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xb3afafaf),
                                Color(0xb36f6f6f),
                              ],
                            ).createShader(bounds);
                          },
                          blendMode: BlendMode.srcATop,
                          child: Text(
                            'Software Developer',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(150),
                              child: Image.asset(
                                'assets/THT.png',
                                width: 400,
                                height: 400,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xFF000000).withOpacity(0.3),
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                  width: 1,
                                  color: Color(0xFFFF9D00),
                                ),
                              ),
                              padding: EdgeInsets.only(
                                  left: 2, top: 2, bottom: 2, right: 10),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFF9D00),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    child: InkWell(
                                        onTap: () {
                                          Fluttertoast.showToast(
                                              msg: 'Hire me is clicked');
                                        },
                                        child: textWithColor_Size(
                                            fweight: 400,
                                            name: "Hire Me",
                                            c1: Colors.white,
                                            fSize: 16)),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        Fluttertoast.showToast(
                                            msg: "Download CV");
                                      },
                                      child: textWithColor_Size(
                                          fweight: 400,
                                          name: 'Download CV',
                                          c1: Colors.white,
                                          fSize: 16)),
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ],
                )),
            textWithColor_Size(
                fweight: 700, name: "My Services", c1: Colors.black, fSize: 34),
            PortfolioCarousel(),
            SizedBox(
              height: 70,
            ),
            textWithColor_Size(
              fweight: 700,
              name: "Who Am I?",
              c1: Colors.black,
              fSize: 38,
            ),
            SizedBox(height: 30),
            WhoAmI(),

            textWithColor_Size(fweight: 700, name: "See my latest projects", c1: Colors.black,fSize: 38,),
            SizedBox(height:30,),
            Dashboardgrid(items: items),
            Container(

                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.orange,
                ),
                child: textWithColor_Size(fweight: 700, name: "See More Projects", c1: Colors.white,)),
            SizedBox(height: 70,),
            textWithColor_Size(fweight: 700, name: "Why Hire Me?", c1: Colors.black, fSize: 38,),
            SizedBox(height: 30,),
            WhyHireMe(),
            SizedBox(height: 70,),
            textWithColor_Size(fweight: 700, name: "Words That Inspire", c1:Colors.black,fSize: 38,),
            SizedBox(height: 30,),
            Text("Discover what clients and collaborators say about working with me. Their feedback reflects the dedication, creativity, and results I bring to every project",
            textAlign: TextAlign.center,
            ),
            SizedBox(height: 30,),




          ]),
        ));
  }

  BoxDecoration ForGradientColor_boxde(
      Color c1, Color c2, int alignment1, int alignment2) {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: get_alignment(alignment1),
        end: get_alignment(alignment2),
        colors: [
          c1,
          c2,
        ],
      ),
    );
  }

  Widget textWithColor_Size(
      {double? fSize,
      required int fweight,
      required String name,
      required Color c1}) {
    return Text(
      name,
      style: TextStyle(
          color: c1,
          fontSize: fSize != null ? fSize : 20,
          fontWeight: _getFontWeight(fweight)),
    );
  }

  FontWeight _getFontWeight(int weight) {
    switch (weight) {
      case 100:
        return FontWeight.w100;
      case 200:
        return FontWeight.w200;
      case 300:
        return FontWeight.w300;
      case 400:
        return FontWeight.w400;
      case 500:
        return FontWeight.w500;
      case 600:
        return FontWeight.w600;
      case 700:
        return FontWeight.w700;
      default:
        return FontWeight.w400;
    }
  }

  Alignment get_alignment(int alignment) {
    switch (alignment) {
      case 0:
        return Alignment.centerLeft;
      case 1:
        return Alignment.center;
      case 2:
        return Alignment.centerRight;
      case 3:
        return Alignment.topLeft;
      case 4:
        return Alignment.topCenter;
      case 5:
        return Alignment.topRight;
      case 6:
        return Alignment.bottomLeft;
      case 7:
        return Alignment.bottomCenter;
      case 8:
        return Alignment.bottomRight;
      default:
        return Alignment.center;
    }
  }
}

class Usefullmethods {
  BoxDecoration ForGradientColor_boxde(
      Color c1, Color c2, int alignment1, int alignment2) {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: get_alignment(alignment1),
        end: get_alignment(alignment2),
        colors: [
          c1,
          c2,
        ],
      ),
    );
  }

  static Widget textWithColor_Size(
      {double? fSize,
      required int fweight,
      required String name,
      required Color c1}) {
    return Text(
      name,
      style: TextStyle(
          color: c1,
          fontSize: fSize != null ? fSize : 20,
          fontWeight: _getFontWeight(fweight)),
    );
  }

  static FontWeight _getFontWeight(int weight) {
    switch (weight) {
      case 100:
        return FontWeight.w100;
      case 200:
        return FontWeight.w200;
      case 300:
        return FontWeight.w300;
      case 400:
        return FontWeight.w400;
      case 500:
        return FontWeight.w500;
      case 600:
        return FontWeight.w600;
      case 700:
        return FontWeight.w700;
      default:
        return FontWeight.w400;
    }
  }

  static Alignment get_alignment(int alignment) {
    switch (alignment) {
      case 0:
        return Alignment.centerLeft;
      case 1:
        return Alignment.center;
      case 2:
        return Alignment.centerRight;
      case 3:
        return Alignment.topLeft;
      case 4:
        return Alignment.topCenter;
      case 5:
        return Alignment.topRight;
      case 6:
        return Alignment.bottomLeft;
      case 7:
        return Alignment.bottomCenter;
      case 8:
        return Alignment.bottomRight;
      default:
        return Alignment.center;
    }
  }
}
