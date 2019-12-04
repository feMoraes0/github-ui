import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 30.0,
          horizontal: 15.0,
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 38.0,
                ),
                child: Text(
                  "GitHub",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextField(
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 20.0,
                ),
                cursorColor: primaryColor,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Username",
                  labelStyle: TextStyle(
                    color: primaryColor,
                    fontSize: 20.0,
                  ),
                ),
              ),
              Container(
                height: 57.0,
                margin: const EdgeInsets.only(top: 15.0),
                child: RaisedButton(
                  onPressed: () {},
                  child: Text(
                  "Enter",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 23.0,
                    color: Colors.white,
                  ),
                ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
