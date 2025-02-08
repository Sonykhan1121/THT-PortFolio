import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/dashboarditem.dart';

class Dashboardgrid extends StatelessWidget {
  final List<DashBoardItem> items;

  const Dashboardgrid({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1,
        ),
        itemCount: items.length,
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
                    items[index].imageUrl,
                    fit: BoxFit.cover,
                    height: 100,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    items[index].title,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
