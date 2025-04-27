import 'dart:html' as html;
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/home_tab_features/providers/home_providers.dart';
import 'package:portfolio/homepage.dart';
import 'package:portfolio/portfolio_carousel.dart';
import 'package:portfolio/testimonial.dart';
import 'package:portfolio/testimonial_cards.dart';
import 'package:portfolio/who_am_i.dart';
import 'package:portfolio/why_hire_me.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../angle_text.dart';
import '../../dashboardGrid.dart';
import '../../dashboarditem.dart';
import '../../footer.dart';
import '../../lets_talk.dart';

class Homeview extends StatefulWidget {
  const Homeview({super.key});

  @override
  State<Homeview> createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void downloadPdfWeb(String url, {String fileName = 'CV.pdf'}) {
    final anchor = html.AnchorElement(href: url)
      ..setAttribute('download', fileName)
      ..click();
  }

  Future<void> sendEmail({
    required String toEmail,
    String subject = '',
    String body = '',
  }) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: toEmail,
      query: encodeQueryParameters(<String, String>{
        subject: body,
      }),
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      throw Exception('Could not launch email app');
    }
  }

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

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
    return Consumer<HomeProviders>(
      builder:
          (BuildContext context, HomeProviders homeProvider, Widget? child) {
        if (homeProvider.isLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (homeProvider.profiles.isEmpty ||
            homeProvider.personalInfos.isEmpty) {
          return Center(child: Text('No data available.'));
        }
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
                                name: homeProvider.profiles[0].name,
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
                            homeProvider.profiles[0].designation,
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
                              child: CachedNetworkImage(
                                height: 400,
                                width: 400,
                                imageUrl: homeProvider.profiles[0].imageUrl,
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(), // while loading
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error), // if failed
                                fit: BoxFit.cover, // if you want
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
                                          sendEmail(
                                              toEmail: homeProvider
                                                  .personalInfos[0].email,
                                              subject:
                                                  "Inquiry Regarding Portfolio",
                                              body: '''
Hello Your Name,

I recently came across your portfolio and was impressed by your work.

I would like to discuss potential opportunities for collaboration or a project I have in mind.

Here are the details:
- Project/Collaboration Type: [...]
- Expected Start Date: [...]
- Additional Information: [...]

Please let me know a suitable time for a meeting or a call.

Looking forward to hearing from you.

Best regards,
[Sender's Name]
[Sender's Company/Organization]
[Sender's Contact Information]
''');
                                        },
                                        child:
                                            Usefullmethods.textWithColor_Size(
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
                                        downloadPdfWeb(
                                            homeProvider.profiles[0].pdfUrl);
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
      },
    );
  }
}
