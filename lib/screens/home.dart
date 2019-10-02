import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import '../models/User.dart';

class Home extends StatelessWidget {

  final Color mainColor = Color(0xff262626);
  final Color secondaryColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    User user = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: Container(
        color: this.mainColor,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "GitHub",
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                      Icon(
                        Icons.search,
                        size: 32.0,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Container(
                    width: 85.0,
                    height: 85.0,
                    margin: EdgeInsets.only(top: 50.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(image: NetworkImage(user.avatarUrl), fit: BoxFit.fill),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 25.0, 30.0, 0.0),
                  child: Text(
                    "Hello, " + user.name,
                    style: TextStyle(
                      fontSize: 24.0,
                      color: this.secondaryColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 20.0),
                  child: Text(
                    user.bio,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Color.fromRGBO(255, 255, 255, 0.7),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: PageView(
                      controller: PageController(initialPage: 0, viewportFraction: 0.8),
                      children: <Widget>[
                        Container(
                          color: Colors.pink,
                          width: 150.0,
                        ),
                        Container(
                          color: Colors.cyan,
                          width: 150.0,
                        ),
                        Container(
                          color: Colors.deepPurple,
                          width: 150.0,
                        ),
                      ],
                    ),
                  )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
