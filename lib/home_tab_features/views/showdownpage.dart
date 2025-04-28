import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';
import 'package:web/web.dart' as web;

import '../providers/home_providers.dart';

class ProjectShowcasePage extends StatefulWidget {
  final int i;

  ProjectShowcasePage({Key? key, required this.i}) : super(key: key);

  @override
  State<ProjectShowcasePage> createState() => _ProjectShowcasePageState();
}

class _ProjectShowcasePageState extends State<ProjectShowcasePage> {
  void openGithubLink(String url) {
    web.window.open(url, '_blank');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void showWebViewDialog(BuildContext context, String url) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              // Header with close button
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Color(0xFF3D5AFE),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Project Demo video',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.close, color: Colors.white),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
              ),
              // WebView content
              Expanded(
                child: InAppWebView(
                  initialUrlRequest: URLRequest(url: WebUri(url)),
                  initialOptions: InAppWebViewGroupOptions(
                    crossPlatform: InAppWebViewOptions(
                      useShouldOverrideUrlLoading: true,
                      mediaPlaybackRequiresUserGesture: false,
                      javaScriptEnabled: true,
                    ),
                  ),
                  onLoadStart: (controller, url) {
                    // You could show a loading indicator here
                  },
                  onLoadStop: (controller, url) {
                    // You could hide a loading indicator here
                  },
                  onLoadError: (controller, url, code, message) {
                    // Handle error
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showYoutubePopup(BuildContext context, String youtubeLink) {
    // Extract video ID from YouTube link if needed
    String videoId = youtubeLink;

    // If the link is a full YouTube URL, extract the video ID
    if (youtubeLink.contains('youtube.com') ||
        youtubeLink.contains('youtu.be')) {
      Uri uri = Uri.parse(youtubeLink);
      if (youtubeLink.contains('youtube.com') &&
          uri.queryParameters.containsKey('v')) {
        videoId = uri.queryParameters['v']!;
      } else if (youtubeLink.contains('youtu.be')) {
        videoId = uri.pathSegments.last;
      }
    }

    // Create embedded YouTube URL
    String embedUrl = 'https://www.youtube.com/embed/$videoId';

    // Show dialog with webview
    showWebViewDialog(context, embedUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProviders>(
      builder:
          (BuildContext context, HomeProviders homeProvider, Widget? child) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Hero section with image and overlay
                Stack(
                  children: [
                    // Project image
                    Container(
                      height: 340,
                      width: double.infinity,
                      child: Image.network(
                        homeProvider.projects[widget.i].images[0],
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey[200],
                            child: Center(
                              child: Icon(
                                Icons.image_not_supported_outlined,
                                color: Colors.grey[400],
                                size: 50,
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    // Gradient overlay
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.white.withOpacity(0.9),
                              Colors.white,
                            ],
                          ),
                        ),
                      ),
                    ),

                    // Title overlay
                    Positioned(
                      bottom: 20,
                      left: 20,
                      right: 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            homeProvider.projects[widget.i].title,
                            style: const TextStyle(
                              color: Color(0xFF212121),
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "by ${homeProvider.projects[widget.i].builtBy}",
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 12),
                          // Tech stack pills
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: (homeProvider
                                    .projects[widget.i].technologies)
                                .map((tech) => Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 6),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF3D5AFE)
                                            .withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(30),
                                        border: Border.all(
                                          color: const Color(0xFF3D5AFE)
                                              .withOpacity(0.3),
                                        ),
                                      ),
                                      child: Text(
                                        tech,
                                        style: const TextStyle(
                                          color: Color(0xFF3D5AFE),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ))
                                .toList(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                // Main content
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Description section with futuristic design
                      Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 20,
                              spreadRadius: 0,
                              offset: const Offset(0, 10),
                            ),
                          ],
                          border: Border.all(
                            color: Colors.grey[100]!,
                            width: 1,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Section header with icon
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF3D5AFE)
                                        .withOpacity(0.1),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.description_outlined,
                                    color: Color(0xFF3D5AFE),
                                    size: 20,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                const Text(
                                  "PROJECT OVERVIEW",
                                  style: TextStyle(
                                    color: Color(0xFF212121),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            // Description text
                            Text(
                              homeProvider.projects[widget.i].description,
                              style: TextStyle(
                                color: Colors.grey[800],
                                fontSize: 16,
                                height: 1.6,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Stats & details section
                      Container(
                        padding: EdgeInsets.zero,
                        child: Row(
                          children: [
                            Expanded(
                              child: _buildStatCard(
                                "GitHub Repository",
                                Icons.code,
                                "View Code",
                                () {
                                  openGithubLink(homeProvider
                                      .projects[widget.i].githubLink);
                                },
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: _buildStatCard(
                                "YouTube Showcase",
                                Icons.play_circle_outline,
                                "Play Demo",
                                () {
                                  showYoutubePopup(
                                      context,
                                      homeProvider
                                          .projects[widget.i].youtubeLink);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 32),

                      // Features section with neon-like design
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "KEY FEATURES",
                            style: TextStyle(
                              color: Color(0xFF212121),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                            ),
                          ),
                          const SizedBox(height: 16),
                          _buildFeatureItem(
                            "Real-time Weather Updates",
                            "Get up-to-the-minute weather information for your location",
                            Icons.update,
                          ),
                          _buildFeatureItem(
                            "Detailed Forecasts",
                            "View hourly and 7-day predictions with comprehensive data",
                            Icons.calendar_today,
                          ),
                          _buildFeatureItem(
                            "Weather Alerts",
                            "Receive immediate notifications for severe weather conditions",
                            Icons.warning_amber,
                          ),
                          _buildFeatureItem(
                            "Location Tracking",
                            "Automatic location detection for the most relevant forecasts",
                            Icons.location_on,
                          ),
                        ],
                      ),

                      const SizedBox(height: 32),

                      // Vote now section
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          gradient: const LinearGradient(
                            colors: [Color(0xFF3D5AFE), Color(0xFF536DFE)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF3D5AFE).withOpacity(0.3),
                              blurRadius: 20,
                              spreadRadius: 0,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            const Text(
                              "LIKE WHAT YOU SEE?",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              "Show your support for this amazing project",
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.8),
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 20),
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  // Handle vote
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: const Color(0xFF3D5AFE),
                                  minimumSize: const Size(200, 48),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24, vertical: 12),
                                ),
                                icon: const Icon(Icons.thumb_up),
                                label: const Text(
                                  "VOTE NOW",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildStatCard(
      String title, IconData icon, String buttonText, VoidCallback onPressed) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            spreadRadius: 0,
            offset: const Offset(0, 5),
          ),
        ],
        border: Border.all(
          color: Colors.grey[100]!,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: const Color(0xFF3D5AFE),
            size: 32,
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFF212121),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: InkWell(
              onTap: onPressed,
              borderRadius: BorderRadius.circular(30),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: const Color(0xFF3D5AFE).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  buttonText,
                  style: const TextStyle(
                    color: Color(0xFF3D5AFE),
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureItem(String title, String description, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            spreadRadius: 0,
            offset: const Offset(0, 5),
          ),
        ],
        border: Border.all(
          color: const Color(0xFF3D5AFE).withOpacity(0.1),
          width: 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFF3D5AFE).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF3D5AFE),
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF212121),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
