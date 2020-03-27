import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:github/components/repository_container.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final String url = 'https://api.github.com/users/femoraes0';

  Future<Map> getUserData() async {
    dynamic response = await http.get(this.url);
    return json.decode(response.body);
  }

  Future<List> getRepositories(String url) async {
    dynamic response = await http.get(url);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size screen = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.add_circle_outline,
          size: 28.0,
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(
              Icons.search,
              size: 28.0,
            ),
          ),
        ],
      ),
      body: FutureBuilder(
          future: this.getUserData(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                print('snapshot');
                print(snapshot.data);
                return SingleChildScrollView(
                  child: Container(
                    width: screen.width,
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
                                    snapshot.data['avatar_url'],
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
                            snapshot.data['name'],
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Text(
                          snapshot.data['login'],
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
                            snapshot.data['bio'],
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
                              Icons.location_on,
                              color: Colors.white,
                              size: 16.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                right: 8.0,
                                left: 2.0,
                              ),
                              child: Text(
                                snapshot.data['location'],
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
                            snapshot.data['blog'],
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                        FutureBuilder(
                            future: this.getRepositories(
                              snapshot.data['repos_url'],
                            ),
                            builder: (context, snapshot) {
                              switch (snapshot.connectionState) {
                                case ConnectionState.done:
                                  print(snapshot.data);
                                  return Container(
                                    margin: const EdgeInsets.only(top: 20.0),
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 5.0),
                                          child: Text(
                                            'Repositories',
                                            style: TextStyle(
                                              fontSize: 18.0,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ),
                                        ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: snapshot.data.length,
                                          itemBuilder: (context, index) {
                                            Map element = snapshot.data[index];
                                            return RepositoryContainer(
                                              name: element['name'],
                                              description:
                                                  element['description'],
                                              stars: element['stargazers_count']
                                                  .toString(),
                                              forks:
                                                  element['forks'].toString(),
                                              language: element['language'],
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                case ConnectionState.waiting:
                                default:
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                              }
                            }),
                      ],
                    ),
                  ),
                );
              case ConnectionState.waiting:
              default:
                return SafeArea(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
            }
          }),
    );
  }
}
