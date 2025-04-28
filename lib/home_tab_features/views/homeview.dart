import 'dart:html' as html;
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:portfolio/home_tab_features/providers/home_providers.dart';
import 'package:portfolio/homepage.dart';
import 'package:portfolio/portfolio_carousel.dart';
import 'package:portfolio/testimonial_cards.dart';
import 'package:portfolio/who_am_i.dart';
import 'package:portfolio/why_hire_me.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../angle_text.dart';
import '../../dashboardGrid.dart';
import '../../footer.dart';
import '../../lets_talk.dart';

class Homeview extends StatefulWidget {
  final TabController controller;
  Homeview({required this.controller, super.key});

  @override
  State<Homeview> createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<void> downloadPdfWeb(String url, {String fileName = 'CV.pdf'}) async {
    final response = await http.get(Uri.parse(url));

    final bytes = response.bodyBytes;
    final blob = html.Blob([bytes]);
    final blobUrl = html.Url.createObjectUrlFromBlob(blob);

    final anchor = html.AnchorElement(href: blobUrl)
      ..setAttribute('download', fileName)
      ..click();

    html.Url.revokeObjectUrl(blobUrl); // Clean up memory
  }

  void openPdfInNewTab(String url) {
    html.window.open(url, '_blank');
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
        'subject': subject,
        'body': body,
      }),
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      throw Exception('Could not launch email app');
    }
  }

  String encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  @override
  Widget build(BuildContext context) {
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
            Dashboardgrid(items: homeProvider.projects),
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
            TestimonialCards(testimonials: homeProvider.testimonials),
            SizedBox(
              height: 70,
            ),
            Transform.rotate(angle: -pi / 80, child: AngleText()),
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
            Footer(widget.controller),
          ]),
        );
      },
    );
  }
}
