import 'package:flutter/material.dart';
import 'package:github/screens/home.dart';
import 'package:github/screens/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Ubuntu'),
      home: Login(),
      routes: {
        "home": (context) => Home(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
