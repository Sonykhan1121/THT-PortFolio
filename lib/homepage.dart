import 'package:flutter/material.dart';
import 'package:portfolio/blogview.dart';
import 'package:portfolio/contactview.dart';
import 'package:portfolio/home_tab_features/views/homeview.dart';
import 'package:portfolio/portfolioview.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  late TabController? _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'AppBar',
          style: TextStyle(
            color: Color(0xFF7626FF),
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.orange,
          unselectedLabelColor: Colors.black,
          indicatorColor: Colors.transparent,
          indicatorWeight: 1.0,
          tabs: [
            Tab(text: 'Home'),
            Tab(text: 'Portfolio'),
            Tab(text: 'Blog'),
            Tab(text: 'Contact'),
          ],
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: Usefullmethods.ForGradientColor_boxde(
              Color(0x405E00FB), Color(0x33FF9900), 0, 2),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Homeview(),
          Portfolioview(),
          Blogview(),
          ContactView(),
        ],
      ),
    );
  }
}

class Usefullmethods {
  static BoxDecoration ForGradientColor_boxde(
      Color c1, Color c2, int alignment1, int alignment2) {
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

  static Widget textWithColor_Size(
      {double? fSize,
      required int fweight,
      required String name,
      required Color c1}) {
    return Text(
      name,
      style: TextStyle(
          color: c1,
          fontSize: fSize != null ? fSize : 20,
          fontWeight: _getFontWeight(fweight)),
    );
  }

  static FontWeight _getFontWeight(int weight) {
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

  static Alignment get_alignment(int alignment) {
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
