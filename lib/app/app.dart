import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:github/app/screens/home.dart';
import 'configs/configs.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final Color secondaryColor = Colors.white;
  GlobalKey _bottomNavigationKey = GlobalKey();
  PageController _pageController = PageController(initialPage: 2);
  int page = 2;

  void updatePage(index) {
    setState(() {
      this.page = index;
    });
    Future.delayed(Duration(milliseconds: 100), () => _pageController.jumpToPage(index));
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        child: PageView(
          controller: _pageController,
          scrollDirection: Axis.horizontal,
          onPageChanged: updatePage,
          children: <Widget>[
            Container(
              color: colors["background"],
              child: Center(
                child: Text("1")
              ),
            ),
            Container(
              color: colors["background"],
              child: Center(
                child: Text("2")
              ),
            ),
            Home(),
            Container(
              color: colors["background"],
              child: Center(
                child: Text("4")
              ),
            ),
            Container(
              color: colors["background"],
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
        color: colors["secondary"],
        buttonBackgroundColor: colors["secondary"],
        backgroundColor: colors["background"],
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 400),
        onTap: (index) {
          updatePage(index);
        },
      ),
    );
  }
}
