
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:hush_day/model/demo_model.dart';
import 'package:hush_day/model/joke_model.dart';

class JokeRepository {
  final String _baseUrl = "https://v2.jokeapi.dev/joke/Any";

  Future getJoke() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      return jokeModelFromJson(response.body);
    } else {
      throw Exception("Failed to load joke");
    }
  }
}

class UserService {
  final String _baseUrl1 = "https://jsonplaceholder.typicode.com/posts";

  Future getApi() async {
    final response = await http.get(Uri.parse(_baseUrl1));
    if( response.statusCode == 200) {
      print("response:${response.body}");
      // List<dynamic> output = jsonDecode(response.body);
      // return UserList.fromJson(response.body);
      return (jsonDecode(response.body)).map((lee) => UserList.fromMap(lee)).toList();
    } else {
      throw Exception("Failed to load Data");
    }
  }
}