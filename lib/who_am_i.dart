import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'homepage.dart';


class WhoAmI extends StatefulWidget {
  const WhoAmI({super.key});

  @override
  State<WhoAmI> createState() => _WhoAmIState();
}

class _WhoAmIState extends State<WhoAmI> {

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
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF000000).withOpacity(0.3)
                        ,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(width: 1,color:Color(0xFFFF9D00), ),
                      ),
                      padding: EdgeInsets.only(left: 2,top: 2,bottom: 2,right: 15),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFFF9D00)
                              ,
                              borderRadius: BorderRadius.circular(30),

                            ),
                            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                            child: InkWell(
                                onTap:(){
                                  Fluttertoast.showToast(msg: 'Personal Information is clicked');
                                },
                                child: Usefullmethods.textWithColor_Size(fweight: 400, name: "Personal Information", c1: Colors.white,fSize: 16)),
                          ),

                          SizedBox(width: 15,),

                          InkWell(
                              onTap: (){
                                Fluttertoast.showToast(msg: "I have 1 month experienced");
                              },
                              child: Usefullmethods.textWithColor_Size(fweight: 400, name: 'Experience', c1: Colors.white,fSize: 16)),
                          SizedBox(width: 15,),
                          InkWell(
                              onTap: (){
                                Fluttertoast.showToast(msg: "I have lots of skills");
                              },
                              child: Usefullmethods.textWithColor_Size(fweight: 400, name: 'Skills', c1: Colors.white,fSize: 16)),
                        ],
                      ),
                    ),
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

