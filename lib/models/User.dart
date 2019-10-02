class User {
  final String login, avatarUrl, name, location, bio;
  final int id;

  User({this.login, this.avatarUrl, this.name, this.location, this.bio, this.id});

  factory User.fromJSON(Map<String, dynamic> data) {
    return User(
      login: data['login'],
      avatarUrl: data['avatar_url'],
      name: data['name'],
      location: data['location'],
      bio: data['bio'],
      id: data['id']
    );
  }

}