import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';

class PortfolioCarousel extends StatefulWidget {
  const PortfolioCarousel({super.key});

  @override
  State<PortfolioCarousel> createState() => _PortfolioCarouselState();
}

class _PortfolioCarouselState extends State<PortfolioCarousel> {
  final PageController _controller = PageController();
  final List<String> _headings = [
    "Website UI",
    "Mobile App",
    "Graphic Design",
    "Custom Software"
  ];
  final List<String> _images = [
    'assets/webui.png',  // Make sure these assets are added in your project
    'assets/android.jpeg',
    'assets/graphics.PNG',
    'assets/custom_software.png'
  ];
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      // Adjust height as needed
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
                controller: _controller,
                itemCount: _headings.length,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                itemBuilder: (_, index) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          spreadRadius: 1,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(
                              _images[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            _headings[index],
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          'A dynamic portfolio showcasing creativity, skills, and achievements all in one place.',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                }),
          ),
          DotsIndicator(
            dotsCount: _headings.length,
            position: _currentPage,
            decorator: DotsDecorator(
              activeColor: Colors.orange,
            ),
          ),
        ],
      ),
    );
  }
}
