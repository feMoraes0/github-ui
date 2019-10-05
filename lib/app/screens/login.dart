import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/User.dart';
import '../configs/configs.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final textController = TextEditingController();
  bool loading = false;

  void accessAPI() async {
    var input = textController.text;
    if (input.isNotEmpty) {
      this.setState(() {
        this.loading = true;
      });
      var userApi = await http.get("https://api.github.com/users/"+input);
      User usr = User.fromJSON(json.decode(userApi.body));
      this.setState(() {
        this.loading = false;
      });
      Navigator.pushNamed(context, "app", arguments: usr);
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        color: colors["secondary"],
        child: Stack(
          children: <Widget>[
            Container(
              width: size.width,
              height: size.height * 0.25,
              color: colors["secondary"],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "GitHub",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 45.0,
                      fontWeight: FontWeight.w900,
                      color: colors["primary"],
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: ClipPath(
                clipper: WaveClipper(),
                child: Container(
                  margin: EdgeInsets.only(top: size.height * 0.20),
                  padding: EdgeInsets.fromLTRB(30.0, 0, 30.0, 0),
                  width: size.width,
                  height: size.height * 0.80,
                  color: colors["primary"],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      TextField(
                        controller: this.textController,
                        maxLines: 1,
                        autocorrect: false,
                        cursorColor: colors["secondary"],
                        style: TextStyle(color: colors["secondary"]),
                        decoration: InputDecoration(
                          labelText: "Username",
                          labelStyle: TextStyle(
                            fontSize: 18.0,
                            color: colors["secondary"],
                          ),
                          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: colors["secondary"])),
                          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: colors["secondary"])),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 35.0),
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          child: Text(
                            "Enter",
                            style: TextStyle(fontSize: 22.0, color: Colors.white),
                          ),
                          onTap: () {
                            return this.accessAPI();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            (this.loading)
                ? Container(
                    width: size.width,
                    height: size.height,
                    color: Color.fromRGBO(0, 0, 0, 0.7),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            "Searching...",
                            style: TextStyle(
                              fontSize: 25.0,
                              color: colors["secondary"],
                            ),
                          ),
                        ),
                        CircularProgressIndicator(
                          valueColor: new AlwaysStoppedAnimation<Color>(colors["secondary"]),
                        )
                      ],
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = new Path();
    path.lineTo(0, size.height * 0.30 - 10);

    path.quadraticBezierTo(size.width * 0.25, size.height * 0.30 + 65, size.width * 0.50, size.height * 0.30);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.30 - 65, size.width, size.height * 0.30 - 10);

    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
