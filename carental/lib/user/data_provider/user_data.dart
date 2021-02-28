import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:logger/logger.dart';
import 'package:carental/user/model/user.dart';

class UserDataProvider {
  var log = Logger();
  final _baseUrl = "http://10.0.2.2:5000";
  final http.Client httpClient;
  final storage = new FlutterSecureStorage();

  UserDataProvider({@required this.httpClient}) : assert(httpClient != null);
  
  
  Future<User> adminLogIn (User user) async{
    final username = 'admin';
    final password = '123456';
    final response = await http.post("$_baseUrl/user/login",
        headers: {"Content-type": "application/json",},
    body: user);
  }

Future<User> LogIn(User user) async {
    
  final response = await httpClient.post("$_baseUrl/user/login",
      headers: {"Content-type": "application/json",},body: user);
  log.d(user);
}



Future<User> SignUp(User user) async{
  final response = await httpClient.post(
    Uri.http('$_baseUrl', '/user/register'),
    headers: <String, String>{
      'Content-Type': 'application/json;+ charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'username': user.username,
      'email': user.email,
      'password': user.password,
    }),
  );
}

}