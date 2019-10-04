import 'package:flutter/material.dart';

class Repositories extends StatelessWidget {
  final Color mainColor = Color(0xff262626);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "repos",
      child: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Icon(
                      Icons.arrow_back,
                      size: 35.0,
                      color: Colors.grey[400],
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(border: Border.all(color: Colors.grey[300]), shape: BoxShape.circle),
                  child: Icon(
                    Icons.folder_open,
                    size: 35.0,
                    color: this.mainColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Text(
                    "Repositories",
                    style: TextStyle(
                      fontSize: 32.0,
                      color: Colors.black,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

    );
  }
}
