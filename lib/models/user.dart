// final user = userFromJson(jsonString);

import 'dart:convert';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));
String postToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
    required this.id,
    required this.name,
    required this.birthdate,
    this.gender,
    required this.ipAddress,
  });

  int id;
  String name;
  DateTime birthdate;
  Enum? gender;
  String ipAddress;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["userId"],
        name: json["name"],
        birthdate: json["birthdate"],
        gender: json["gender"],
        ipAddress: json["ipAddress"],
      );
  Map<String, dynamic> toJson() => {
        "userId": id,
        "name": name,
        "birthdate": birthdate,
        "gender": gender,
        "ipAddress": ipAddress,
      };
}
