import 'package:flutter/material.dart';
import 'app/app.dart';
import 'app/screens/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Ubuntu'),
      home: Login(),
      routes: {
        "app": (context) => App(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
