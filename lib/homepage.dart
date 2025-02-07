import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:  Text(
                'AppBar',
                style: TextStyle(
                  color: Color(0xFF7626FF),

                ),
              ),


          centerTitle: true,
          flexibleSpace: Container(
            decoration: ForGradientColor_boxde(Colors.white, Color(0x33FF9900),0,2),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              decoration: ForGradientColor_boxde(Colors.white, Color(0x33FF9900),0,2),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      textWithColor_Size(name: "Home", c1: Color(0xFFFF9D00),fSize: 16,fweight: 700),
                      textWithColor_Size(name: "Portfolio", c1: Colors.black,fSize: 16,fweight: 400),
                      textWithColor_Size(name: "Blog", c1: Colors.black,fSize: 16,fweight: 400),
                      textWithColor_Size(name: "Contact", c1: Colors.black,fSize: 16,fweight: 400),
                    ],
                  ),
                  SizedBox(height:40),
                  Column(
                    children: [
                      textWithColor_Size(name:"Hello", c1:Colors.black,fSize:30, fweight: 400),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          textWithColor_Size(name:"I'm ", c1:Colors.black,fSize:30, fweight: 400),
                          textWithColor_Size(name:"Sony khan", c1:Color(0xFFFF9D00),fSize:30, fweight: 700),


                        ],
                      ),
                      ShaderMask(
                        shaderCallback: (Rect bounds){
                          return LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xb3afafaf),
                              Color(0xb36f6f6f),
                            ],
                          ).createShader(bounds);
                        },
                        blendMode: BlendMode.srcATop,
                        child: Text('Software Developer',style: TextStyle(

                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),),
                      ),


                          ClipRRect(
                            borderRadius: BorderRadius.circular(150),
                            child:Image.asset(
                              'assets/profile.PNG',

                            width: 250,
                            height: 250,
                            fit: BoxFit.cover,
                            ),
                          ),


                    ],
                  ),
                ],
              )
            )
          ]),
        ));
  }

  BoxDecoration ForGradientColor_boxde(Color c1, Color c2, int alignment1,int alignment2) {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: get_alignment(alignment1),
        end: get_alignment(alignment2),
        colors: [
          c1,
          c2,
        ],

      ),
    );
  }

  Widget textWithColor_Size({double? fSize,required int fweight,required String name, required Color c1}) {
    return Text(
      name,
      style: TextStyle(color: c1,fontSize: fSize!=null?fSize:20,fontWeight: _getFontWeight(fweight)),
    );
  }
  FontWeight _getFontWeight(int weight) {
    switch (weight) {
      case 100:
        return FontWeight.w100;
      case 200:
        return FontWeight.w200;
      case 300:
        return FontWeight.w300;
      case 400:
        return FontWeight.w400;
      case 500:
        return FontWeight.w500;
      case 600:
        return FontWeight.w600;
      case 700:
        return FontWeight.w700;
      default:
        return FontWeight.w400;
    }
  }
  Alignment get_alignment(int alignment) {
    switch (alignment) {
      case 0:
        return Alignment.centerLeft;
      case 1:
        return Alignment.center;
      case 2:
        return Alignment.centerRight;
      case 3:
        return Alignment.topLeft;
      case 4:
        return Alignment.topCenter;
      case 5:
        return Alignment.topRight;
      case 6:
        return Alignment.bottomLeft;
      case 7:
        return Alignment.bottomCenter;
      case 8:
        return Alignment.bottomRight;
      default:
        return Alignment.center;
    }
  }
}
