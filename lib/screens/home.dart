import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:github/components/load.dart';
import 'package:github/components/repository_container.dart';
import 'package:http/http.dart' as http;
import 'package:feather_icons_flutter/feather_icons_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final String url = 'https://api.github.com/users/femoraes0';
  Map userData;
  List repositories;

  @override
  void initState() {
    this.userData = null;
    this.repositories = null;
    this.getData();
    super.initState();
  }

  Future<void> getData() async {
    dynamic responseUser = await http.get(this.url);
    Map userData = json.decode(responseUser.body);

    print(userData);

    dynamic responseRepos = await http.get(userData['repos_url']);
    List repositories = json.decode(responseRepos.body);

    print(repositories);

    setState(() {
      this.userData = userData;
      this.repositories = repositories;
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size screen = MediaQuery.of(context).size;

    return (this.userData != null || this.repositories != null)
        ? Scaffold(
            appBar: AppBar(
              leading: Icon(
                FeatherIcons.github,
                size: 28.0,
              ),
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(
                    FeatherIcons.search,
                    size: 28.0,
                  ),
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5.0,
                          horizontal: 10.0,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: theme.primaryColor,
                        ),
                        child: Text(
                          'Follow',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                      Container(
                        height: screen.width * 0.40,
                        width: screen.width * 0.40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(180),
                          color: Colors.redAccent,
                          image: DecorationImage(
                            image: NetworkImage(
                              this.userData['avatar_url'],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5.0,
                          horizontal: 10.0,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Color.fromRGBO(224, 105, 198, 1.0),
                        ),
                        child: Text(
                          'Sponsor',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                      bottom: 3.0,
                    ),
                    child: Text(
                      this.userData['name'],
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    this.userData['login'],
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white54,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8.0,
                      bottom: 4.0,
                    ),
                    child: Text(
                      this.userData['bio'],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        FeatherIcons.mapPin,
                        color: Colors.white,
                        size: 15.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 8.0,
                          left: 3.0,
                        ),
                        child: Text(
                          this.userData['location'],
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Text(
                      this.userData['blog'],
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  Container(
                    width: screen.width,
                    padding: const EdgeInsets.only(
                      bottom: 5.0,
                    ),
                    margin: const EdgeInsets.only(
                      left: 20.0,
                      top: 20.0,
                    ),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          FeatherIcons.folder,
                          size: 22,
                          color: Colors.white,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            'Repositories',
                            style: TextStyle(
                              fontSize: 22.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: this.repositories.length,
                      itemBuilder: (context, index) {
                        Map element = this.repositories[index];
                        return RepositoryContainer(
                          name: element['name'],
                          description: element['description'],
                          stars: element['stargazers_count'].toString(),
                          forks: element['forks'].toString(),
                          language: element['language'],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        : Load();
  }
}
