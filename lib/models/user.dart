// final user = userFromJson(jsonString);

import 'dart:convert';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));
String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
    required this.id,
    required this.name,
    required this.birthdate,
    this.gender,
    required this.ipv4,
  });

  String id;
  String name;
  String birthdate;
  String? gender;
  String ipv4;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["userId"],
        name: json["name"],
        birthdate: json["birthdate"],
        gender: json["gender"],
        ipv4: json["ipv4"],
      );
  Map<String, dynamic> toJson() => {
        "userId": id,
        "name": name,
        "birthdate": birthdate,
        "gender": gender,
        "ipAddress": ipv4,
      };
}
