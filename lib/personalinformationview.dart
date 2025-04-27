import 'package:flutter/material.dart';
import 'package:portfolio/home_tab_features/providers/home_providers.dart';
import 'package:provider/provider.dart';

class Personalinformationview extends StatelessWidget {
  const Personalinformationview({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProviders>(builder: (BuildContext context, HomeProviders homeProvider, Widget? child) {
      return Center(
        child: Container(
          padding: EdgeInsets.all(20),
          height: 600,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 60),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 25,),
                      Text(
                        homeProvider.personalInfos[0].shortDescription,
                        style:
                        TextStyle(fontWeight:FontWeight.w500, fontSize: 18,),
                      ),
                      SizedBox(height: 25,),
                      IconText(iconData: Icons.phone, text: homeProvider.personalInfos[0].phone,),
                      IconText(iconData: Icons.email, text: homeProvider.personalInfos[0].email,),
                      IconText(iconData: Icons.school, text: homeProvider.personalInfos[0].degree,),
                      IconText(iconData: Icons.location_on, text: homeProvider.personalInfos[0].address,),


                    ],
                  ),
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Container(
                    height: 500,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(250),
                      image: DecorationImage(image: NetworkImage(homeProvider.profiles[0].imageUrl),fit: BoxFit.scaleDown,),
                    ),
                  ))
            ],
          ),
        ),
      );
    },

    );
  }
}
class IconText extends StatelessWidget {
  final IconData iconData;
  final String text;
  const IconText({super.key, required this.iconData, required this.text});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Icon(iconData,size: 20,),
        SizedBox(width: 10,),
        Text(text),
      ],

    );
  }
}