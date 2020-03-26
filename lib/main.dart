import 'package:flutter/material.dart';
import 'package:github/screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        backgroundColor: Color.fromRGBO(36, 41, 46, 1.0),
        primaryColor: Color.fromRGBO(86, 171, 96, 1.0),
        scaffoldBackgroundColor: Color.fromRGBO(36, 41, 46, 1.0),
        appBarTheme: AppBarTheme(
          color: Color.fromRGBO(36, 41, 46, 1.0),
          elevation: 0.0,
        )
      ),
      home: Home(),
    );
  }
}
