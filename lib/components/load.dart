import 'package:flutter/material.dart';

class Load extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
