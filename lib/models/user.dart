// final user = userFromJson(jsonString);

import 'dart:convert';

// List<User> userFromJson(String str) =>
//     List<User>.from(json.decode(str).map((x) => User.fromJson(x)));
// String userToJson(List<User> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class User {
//   User({
//     required this.id,
//     required this.name,
//     required this.age,
//     required this.gender,
//     this.avatarUrl,
//     this.email,
//     this.phone,
//     required this.ipv4,
//   });

//   int id;
//   String name;
//   int age;
//   String gender;
//   String? avatarUrl;
//   String? email;
//   String? phone;
//   String ipv4;

//   factory User.fromJson(Map<String, dynamic> json) => User(
//         id: json["userId"],
//         name: json["name"],
//         age: json["age"],
//         gender: json["gender"],
//         avatarUrl: json["avatarUrl"],
//         email: json["email"],
//         phone: json["phone"],
//         ipv4: json["ipv4"],
//       );
//   Map<String, dynamic> toJson() => {
//         "userId": id,
//         "name": name,
//         "age": age,
//         "gender": gender,
//         "ipAddress": ipv4,
//       };
// }

List<Post> postFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));
String postToJson(List<Post> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  Post({
    required this.userId,
    required this.id,
    required this.title,
    this.body,
  });

  int userId;
  int id;
  String title;
  String? body;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );
  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
