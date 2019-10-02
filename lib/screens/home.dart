import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:github/main.dart';
import '../models/User.dart';

class Home extends StatelessWidget {
  final Color mainColor = Color(0xff262626);

  final Color secondaryColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    User user = ModalRoute
      .of(context)
      .settings
      .arguments;

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
                        Icons.exit_to_app,
                        size: 32.0,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Container(
                    width: 70.0,
                    height: 70.0,
                    margin: EdgeInsets.only(top: 40.0, bottom: 20.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(image: NetworkImage(user.avatarUrl), fit: BoxFit.fill),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
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
                      controller: PageController(initialPage: 0, viewportFraction: 0.9),
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        GestureDetector(
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            child: Card(
                              title: "Repositories",
                              icon: Icons.folder_open,
                              link: ""
                            ),
                          ),
                          onTap: () {},
                        ),
                        GestureDetector(
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            child: Card(
                              title: "Subscriptions",
                              icon: Icons.local_offer,
                              link: ""
                            ),
                          ),
                          onTap: () {},
                        ),
                        GestureDetector(
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            child: Card(
                              title: "Following",
                              icon: Icons.people_outline,
                              link: ""
                            ),
                          ),
                          onTap: () {},
                        ),
                        GestureDetector(
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            child: Card(
                              title: "Followers",
                              icon: Icons.person_outline,
                              link: ""
                            ),
                          ),
                          onTap: () {},
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

class Card extends StatelessWidget {

  final String title, link;
  final IconData icon;

  const Card({Key key, this.title, this.link, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 50.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 8.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.grey[400]
              )
            ),
            child: Icon(
              this.icon,
              color: Color(0xff262626),
            ),
          ),
          Text(
            this.title,
            style: TextStyle(
              fontSize: 35.0,
              color: Color(0xff262626),
            ),
          ),
        ],
      ),
    );
  }
}

