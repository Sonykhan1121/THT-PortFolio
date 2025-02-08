import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'homepage.dart';


class WhyHireMe extends StatefulWidget {
  const WhyHireMe({super.key});

  @override
  State<WhyHireMe> createState() => _WhyHireMeState();
}

class _WhyHireMeState extends State<WhyHireMe> {

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Container(
        padding: EdgeInsets.all(20),
        height: 400,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 2,
                child: Container(
                  height: 300,
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(

                    image: DecorationImage(image: AssetImage('assets/profile.PNG'),fit: BoxFit.cover,),
                  ),
                )),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('A Commitment to Quality and Creativity', style: TextStyle(fontWeight: FontWeight.bold),),
                  Text(
                    " I thrive on collaboration within agile teams, adapt quickly to new technologies and challenges, and am committed to continuous learning to stay ahead in the ever-evolving software engineering industry.  I am proficient in [list key technologies, e.g., Java, Python, Flutter, React, AWS, Docker, Kubernetes] and am always eager to expand my skillset. Choosing me means choosing a dedicated and results-oriented engineer who genuinely cares about turning your vision into a high-quality, maintainable, and performant product. ",
                    style:
                    TextStyle(fontWeight:FontWeight.w400, fontSize: 16,),
                  ),
                  SizedBox(height: 25,),
                  Container(

                      padding: EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.orange,
                      ),
                      child: Usefullmethods.textWithColor_Size(fweight: 700, name: "Hire Me", c1: Colors.white,)),


                ],
              ),
            )
          ],
        ),
      ),
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

