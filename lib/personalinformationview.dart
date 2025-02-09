import 'package:flutter/material.dart';

class Personalinformationview extends StatelessWidget {
  const Personalinformationview({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(20),
        height: 400,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 25,),
                  Text(
                    "I’m Sonykhan, a Software Developer passionate about creating impactful solutions in Android Development. With 1 month of experience, I thrive on innovation, collaboration, and continuous growth. Let’s connect and build something amazing!",
                    style:
                    TextStyle(fontWeight:FontWeight.w400, fontSize: 16,),
                  ),
                  SizedBox(height: 25,),
                  IconText(iconData: Icons.phone, text: '+880 1714133768',),
                  IconText(iconData: Icons.email, text: 'sonykhan1121@gmail.com',),
                  IconText(iconData: Icons.school, text: 'BSc on Computer Science & Engineering',),
                  IconText(iconData: Icons.location_on, text: 'Uttara EPZ, Nilphamari , Bangladesh',),


                ],
              ),
            ),
            Expanded(
                flex: 2,
                child: Container(
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(150),
                    image: DecorationImage(image: AssetImage('assets/profile.PNG'),fit: BoxFit.cover,),
                  ),
                ))
          ],
        ),
      ),
    );;
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