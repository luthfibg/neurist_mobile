// import 'package:flutter/material.dart';

import '../models/user.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  // Future<List<User>?> getUsers() async {
  // Future<List<User>?> getUsers() async {
  //   var client = http.Client();
  //   var uri = Uri.parse('https://mockend.com/luthfibg/neurist_mobile/users');
  //   var response = await client.get(uri);

  //   if (response.statusCode == 200) {
  //     var json = response.body;
  //     return userFromJson(json);
  //   }
  //   return userFromJson('Data Not Found');
  // }

  Future<List<Post>?> getPosts() async {
    var client = http.Client();
    var uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await client.get(uri);

    if (response.statusCode == 200) {
      var json = response.body;
      return postFromJson(json);
    }
    return postFromJson('Data Not Found');
  }
}
