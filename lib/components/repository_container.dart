import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';

class RepositoryContainer extends StatelessWidget {
  final String name, description, stars, forks, language;

  const RepositoryContainer({
    Key key,
    this.name,
    this.description,
    this.stars,
    this.forks,
    this.language,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            this.name ?? '',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 18.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 6.0,
            ),
            child: (this.description != null)
                ? Text(
                    this.description ?? '',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                    ),
                  )
                : Container(),
          ),
          Row(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(
                  right: 10.0,
                ),
                child: Text(
                  this.language ?? 'Unkown',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.white,
                  ),
                ),
              ),
              Icon(
                FeatherIcons.star,
                size: 15.0,
                color: Colors.white,
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: 5.0,
                  right: 10.0,
                ),
                child: Text(
                  this.stars,
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.white,
                  ),
                ),
              ),
              Icon(
                FeatherIcons.gitBranch,
                size: 15.0,
                color: Colors.white,
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: 5.0,
                  right: 10.0,
                ),
                child: Text(
                  this.forks,
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
