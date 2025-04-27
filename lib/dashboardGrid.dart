import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/dashboarditem.dart';
import 'package:provider/provider.dart';

import 'footer.dart';
import 'home_tab_features/providers/home_providers.dart';
import 'homepage.dart';
import 'lets_talk.dart';

class Dashboardgrid extends StatelessWidget {
  final List<DashBoardItem> items;

  const Dashboardgrid({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProviders>(builder: (cnt, homeProvider, _) {
      return SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 100, vertical: 50),
          child: Column(
            children: [
              SizedBox(height: 10),
              // Remove the Expanded widget here
              GridView.builder(
                shrinkWrap: true,
                // Add this line
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 1,
                ),
                itemCount: homeProvider.projects.length,
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
                          child: Image.network(
                            homeProvider.projects[index].images[0],
                            fit: BoxFit.cover,
                            height: 100,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            homeProvider.projects[index].title,
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
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.orange,
                ),
                child: Usefullmethods.textWithColor_Size(
                  fweight: 700,
                  name: "See More ",
                  c1: Colors.white,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
