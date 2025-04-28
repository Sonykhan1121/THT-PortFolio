import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/home_tab_features/providers/home_providers.dart';
import 'package:provider/provider.dart';

class PortfolioCarousel extends StatefulWidget {
  const PortfolioCarousel({super.key});

  @override
  State<PortfolioCarousel> createState() => _PortfolioCarouselState();
}

class _PortfolioCarouselState extends State<PortfolioCarousel> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProviders>(
      builder:
          (BuildContext context, HomeProviders homeProvider, Widget? child) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: 400,
          // Adjust height as needed
          child: Column(
            children: [
              Expanded(
                child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context).copyWith(
                    scrollbars: false,
                    dragDevices: {
                      PointerDeviceKind.touch,
                      PointerDeviceKind.mouse, // Allow mouse drag
                    },
                  ),
                  child: PageView.builder(
                      controller: _controller,
                      itemCount: homeProvider.services.length,
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
                                    child: CachedNetworkImage(
                                      imageUrl: homeProvider
                                          .services[index].imageUrl!,
                                      placeholder: (context, url) =>
                                          CircularProgressIndicator(), // while loading
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error), // if failed
                                      fit: BoxFit.cover, // if you want
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  homeProvider.services[index].title,
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Text(
                                homeProvider.services[index].description,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              ),
              DotsIndicator(
                dotsCount: homeProvider.services.length,
                position: _currentPage,
                onTap: (index) {
                  _controller.animateToPage(
                    index,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                decorator: DotsDecorator(
                  activeColor: Colors.orange,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
