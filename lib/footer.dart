import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/home_tab_features/providers/home_providers.dart';
import 'package:provider/provider.dart';

class Footer extends StatelessWidget {
  final TabController tabController;

  const Footer(this.tabController, {super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProviders>(
      builder:
          (BuildContext context, HomeProviders homeProvider, Widget? child) {
        return Container(
          color: const Color(0xFFFAF5E6), // Background color (light beige)
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'LOGO',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: MediaQuery.of(context).size.width *
                            0.4, // Adjust width as needed
                        child: const Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed congue interdum ligula a dignissim. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed lobortis orci elementum egestas lobortis.',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(FontAwesomeIcons.facebook),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: FaIcon(FontAwesomeIcons.instagram),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: FaIcon(FontAwesomeIcons.whatsapp),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: FaIcon(FontAwesomeIcons
                                .youtube), // Replace with your desired icon
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Navigation',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                      const SizedBox(height: 10),
                      InkWell(
                          onTap: () {
                            tabController.animateTo(0);
                          },
                          child: const Text('Home',
                              style: TextStyle(color: Colors.black))),
                      const SizedBox(height: 5),
                      InkWell(
                        onTap: () {
                          tabController.animateTo(1);
                        },
                        child: const Text('Portfolio',
                            style: TextStyle(color: Colors.black)),
                      ),
                      const SizedBox(height: 5),
                      InkWell(
                          onTap: () {
                            tabController.animateTo(2);
                          },
                          child: Text('Blog',
                              style: TextStyle(color: Colors.black))),
                      const SizedBox(height: 5),
                      InkWell(
                        onTap: () {
                          tabController.animateTo(3);
                        },
                        child: const Text('Contact',
                            style: TextStyle(color: Colors.black)),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Contact',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(homeProvider.personalInfos[0].phone,
                          style: TextStyle(color: Colors.black)),
                      const SizedBox(height: 5),
                      Text(homeProvider.personalInfos[0].email,
                          style: TextStyle(color: Colors.black)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Divider(
                color: Colors.orange, // Color of the divider
                thickness: 2, // Thickness of the divider
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Copyright© 2024 ${homeProvider.profiles[0].name}. All Rights Reserved.',
                      style: TextStyle(color: Colors.black),
                    ),
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Text('User Terms & Conditions',
                              style: TextStyle(color: Colors.black)),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text('Privacy Policy',
                              style: TextStyle(color: Colors.black)),
                        ),
                      ],
                    ),
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
