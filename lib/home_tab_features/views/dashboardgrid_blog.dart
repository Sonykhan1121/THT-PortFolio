import 'package:flutter/material.dart';
import 'package:portfolio/dashboarditem.dart';

import '../../homepage.dart';

class DashboardgridBlog extends StatefulWidget {
  final List<DashBoardItem> items;

  const DashboardgridBlog({super.key, required this.items});

  @override
  State<DashboardgridBlog> createState() => _DashboardgridBlogState();
}

class _DashboardgridBlogState extends State<DashboardgridBlog> {
  // Initially show only 9 items
  bool _showAll = false;

  @override
  Widget build(BuildContext context) {
    // Calculate displayed items based on the show more state
    final displayedItems = _showAll
        ? widget.items
        : widget.items.length > 9
            ? widget.items.sublist(0, 9)
            : widget.items;

    // Check if we need to show the "Show More" button
    final bool hasMoreItems = widget.items.length > 9;

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10),
          GridView.builder(
            shrinkWrap: true, // Important to work inside SingleChildScrollView
            physics:
                NeverScrollableScrollPhysics(), // Disable scrolling for GridView
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1,
            ),
            itemCount: displayedItems.length,
            itemBuilder: (context, int index) {
              return Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Image.asset(
                        displayedItems[index].imageUrl,
                        fit: BoxFit.cover,
                        height: 100,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        displayedItems[index].title,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          SizedBox(height: 30),
          // Only show the button if there are more items to display
          if (hasMoreItems)
            InkWell(
              onTap: () {
                setState(() {
                  _showAll = !_showAll; // Toggle the state
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.orange,
                ),
                child: Usefullmethods.textWithColor_Size(
                  fweight: 700,
                  name: _showAll ? "Show Less" : "Show More",
                  c1: Colors.white,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
