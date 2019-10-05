import 'package:flutter/material.dart';
import 'package:github/app/models/User.dart';
import 'package:github/app/configs/configs.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    User user = ModalRoute.of(context).settings.arguments;
    Size size = MediaQuery.of(context).size;

    return Container(
      color: colors["background"],
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  GestureDetector(
                    child: Icon(
                      Icons.exit_to_app,
                      size: 30.0,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            Container(
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(20.0, 80.0, 20.0, 20.0),
                    margin: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0.0),
                    transform: Matrix4.translationValues(0.0, 55.0, 0.0),
                    width: size.width - 40,
                    decoration: BoxDecoration(
                      color: colors["secondary"],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text("Hello World"),
                  ),
                  Container(
                    width: 110.0,
                    height: 110.0,
                    transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(user.avatarUrl)
                      )
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
