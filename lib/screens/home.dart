import 'dart:convert';

import 'package:flutter/material.dart';
import '../models/User.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    User user = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: Container(
        color: Colors.greenAccent,
        child: Center(
          child: Text(
            user.name
          ),
        ),
      ),
    );
  }
}
