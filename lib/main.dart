import 'package:flutter/material.dart';
import 'package:github/login/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Ubuntu',
        backgroundColor: Colors.white,
        primaryColor: Colors.black,
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))
        )
      ),
      darkTheme: ThemeData(
        fontFamily: 'Ubuntu',
        backgroundColor: Colors.black,
        primaryColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white))
        )
      ),
      home: Login(),
    );
  }
}
