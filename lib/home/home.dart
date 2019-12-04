import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Widget getList({@required IconData icon, bool border = false}) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
          child: Icon(icon, size: 55.0),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Text(
            "000",
            style: TextStyle(
              fontSize: 26.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        (border ? Divider(color: Colors.white) : Container())
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Row(
        children: <Widget>[
          Container(
            width: size.width * 0.75,
          ),
          Container(
              width: size.width * 0.25,
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              height: size.height,
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    color: Colors.white54,
                    width: 1.0,
                  ),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  this.getList(icon: Icons.person_outline, border: true),
                  this.getList(icon: Icons.people_outline, border: true),
                  this.getList(icon: Icons.insert_drive_file, border: true),
                  this.getList(icon: Icons.folder_open),
                ],
              ))
        ],
      ),
    );
  }
}
