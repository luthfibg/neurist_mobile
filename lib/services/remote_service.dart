import 'package:flutter/material.dart';

import '../models/user.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  Future<List<User>?> getUsers() async {
    var client = http.Client();
    var uri = Uri.parse('https://631069f3826b98071a40de30.mockapi.io/users');
    var response = await client.get(uri);

    if (response.statusCode == 200) {
      var json = response.body;
      return userFromJson(json);
    }
    return userFromJson('Data Not Found');
  }
}
