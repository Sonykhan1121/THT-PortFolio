import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:portfolio/homepage.dart';
import 'package:portfolio/portfolio_carousel.dart';
import 'package:portfolio/testimonial.dart';
import 'package:portfolio/testimonial_cards.dart';
import 'package:portfolio/who_am_i.dart';
import 'package:portfolio/why_hire_me.dart';

import 'angle_text.dart';
import 'dashboardGrid.dart';
import 'dashboarditem.dart';
import 'footer.dart';
import 'lets_talk.dart';

class Homeview extends StatelessWidget {

  const Homeview({super.key});

  @override
  Widget build(BuildContext context) {
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
    final List<Testimonial> testimonials = [
      Testimonial(
          quote: "Your app brings so much peace and tolerance to our home.",
          author: "Rachel, UK",
          location: "on meditation's positive effect on family life",
          context: "Context of the testimonial if needed"),
      Testimonial(
          quote:
          "I came to learn that the storyline in my head was holding me back.",
          author: "Peter, Belgium",
          location: "on what he learned when sitting with himself",
          context: "Context of the testimonial if needed"),
      Testimonial(
          quote:
          "Headspace provides me with a connection to myself, and a disconnection from negative thoughts, feelings, and sensations.",
          author: "Keri, UK",
          location: "on finding her happy place",
          context: "Context of the testimonial if needed"),
    ];
    return SingleChildScrollView(
      child: Column(children: [
        Container(
            decoration: Usefullmethods.ForGradientColor_boxde(
                Color(0x405E00FB), Color(0x33FF9900), 0, 2),
            child: Column(
              children: [

                SizedBox(
                  height: 40,
                ),
                Column(
                  children: [
                    Usefullmethods.textWithColor_Size(
                        name: "Hello",
                        c1: Colors.black,
                        fSize: 30,
                        fweight: 400),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Usefullmethods.textWithColor_Size(
                            name: "I'm ",
                            c1: Colors.black,
                            fSize: 30,
                            fweight: 400),
                        Usefullmethods.textWithColor_Size(
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
                                    child: Usefullmethods.textWithColor_Size(
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
                                  child: Usefullmethods.textWithColor_Size(
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
        Usefullmethods.textWithColor_Size(
            fweight: 700, name: "My Services", c1: Colors.black, fSize: 34),
       PortfolioCarousel(),
        SizedBox(
          height: 70,
        ),
        Usefullmethods.textWithColor_Size(
          fweight: 700,
          name: "Who Am I?",
          c1: Colors.black,
          fSize: 38,
        ),
        SizedBox(height: 30),
        WhoAmI(),
        Usefullmethods.textWithColor_Size(
          fweight: 700,
          name: "See my latest projects",
          c1: Colors.black,
          fSize: 38,
        ),

        Dashboardgrid(items: items),

        SizedBox(
          height: 70,
        ),
        Usefullmethods.textWithColor_Size(
          fweight: 700,
          name: "Why Hire Me?",
          c1: Colors.black,
          fSize: 38,
        ),
        SizedBox(
          height: 30,
        ),
        WhyHireMe(),
        SizedBox(
          height: 70,
        ),
        Usefullmethods.textWithColor_Size(
          fweight: 700,
          name: "Words That Inspire",
          c1: Colors.black,
          fSize: 38,
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          "Discover what clients and collaborators say about working with me. Their feedback reflects the dedication, creativity, and results I bring to every project",
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 30,
        ),

        TestimonialCards(testimonials: testimonials),

        SizedBox(
          height: 70,
        ),
        Transform.rotate(angle: -pi / 30, child: AngleText()),
        SizedBox(
          height: 100,
        ),
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

      ]),
    );
  }
}
