import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:logger/logger.dart';
import 'package:carental/models/models.dart';

class UserDataProvider {
  var log = Logger();
  final _baseUrl = "http://10.2.2.2:5000";
  final storage = new FlutterSecureStorage();

  
  
  // Future<User> adminLogIn (User user) async{
  //   final username = 'admin';
  //   final password = '123456';
  //   final response = await http.post("$_baseUrl/user/login",
  //       headers: {"Content-type": "application/json",},
  //   body: user);
  // }

Future<User> LogIn(User user) async {
    
  final response = await http.post(formater("/user/login"),
      headers: {"Content-type": "application/json",},body: user);
  log.d(user);
}



Future<User> SignUp(User user) async{
  final response = await http.post(
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

  String formater(String url){
    return _baseUrl + url;
  }

}