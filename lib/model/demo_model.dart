// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// UserList userListFromJson(String str) => UserList.fromJson(json.decode(str));

// String userListToJson(UserList data) => json.encode(data.toJson());

class UserList {
  int? userId;
  int? id;
  String title;
  String body;

  UserList({ required this.title, required this.body, required this.id, required this.userId});



  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }

  factory UserList.fromMap(Map<String, dynamic> map) {
    return UserList(
      userId: map['userId'] != null ? map['userId'] as int : null,
      id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] as String,
      body: map['body'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserList.fromJson(String source) => UserList.fromMap(json.decode(source));
}

