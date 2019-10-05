import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../models/User.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Color mainColor = Color(0xff262626);
  final Color secondaryColor = Colors.white;
  GlobalKey _bottomNavigationKey = GlobalKey();
  PageController _pageController = PageController(initialPage: 2);
  int page = 2;

  void updatePage(index) {
    setState(() {
      this.page = index;
    });
    Future.delayed(Duration(milliseconds: 600), () => _pageController.jumpToPage(index));
  }

  @override
  Widget build(BuildContext context) {
    User user = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: Container(
        color: this.mainColor,
        child: PageView(
          controller: _pageController,
          scrollDirection: Axis.horizontal,
          onPageChanged: updatePage,
          children: <Widget>[
            Container(
              color: Color(0xfff1f1f1),
              child: Center(
                child: Text("1")
              ),
            ),
            Container(
              color: Color(0xfff1f1f1),
              child: Center(
                child: Text("2")
              ),
            ),
            Container(
              color: Color(0xfff1f1f1),
              child: Center(
                child: Text("3")
              ),
            ),
            Container(
              color: Color(0xfff1f1f1),
              child: Center(
                child: Text("4")
              ),
            ),
            Container(
              color: Color(0xfff1f1f1),
              child: Center(
                child: Text("5")
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: this.page,
        height: 50.0,
        items: <Widget>[
          Icon(Icons.star_border, size: 30),
          Icon(Icons.folder_open, size: 30),
          Icon(Icons.home, size: 30),
          Icon(Icons.people_outline, size: 30),
          Icon(Icons.person_pin, size: 30),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Color(0xfff1f1f1),
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          updatePage(index);
        },
      ),
    );
  }
}
