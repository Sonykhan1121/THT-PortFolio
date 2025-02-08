import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFAF5E6), // Background color (light beige)
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child:  Column(
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
                    width: MediaQuery.of(context).size.width * 0.4, // Adjust width as needed
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
                        icon: const Icon(Icons.facebook),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.message),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.message),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.circle), // Replace with your desired icon
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
                  const Text('Home', style: TextStyle(color: Colors.black)),
                  const SizedBox(height: 5),
                  const Text('Portfolio', style: TextStyle(color: Colors.black)),
                  const SizedBox(height: 5),
                  const Text('Blog', style: TextStyle(color: Colors.black)),
                  const SizedBox(height: 5),
                  const Text('Contact', style: TextStyle(color: Colors.black)),
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
                  const Text('+880 1743830062', style: TextStyle(color: Colors.black)),
                  const SizedBox(height: 5),
                  const Text('design.mdgrpias@gmail.com', style: TextStyle(color: Colors.black)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Divider(
            color: Colors.orange, // Color of the divider
            thickness: 2,       // Thickness of the divider
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Copyright© 2024 Md G R Pias. All Rights Reserved.',
                  style: TextStyle(color: Colors.black),
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text('User Terms & Conditions', style: TextStyle(color: Colors.black)),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Privacy Policy', style: TextStyle(color: Colors.black)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}