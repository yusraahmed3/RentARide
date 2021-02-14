import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class NetworkHandler{
  var log = Logger();
  String baseUrl = "http://10.0.2.2:5000";
  FlutterSecureStorage storage = FlutterSecureStorage();

  Future get(String url) async{
    String token = await storage.read(key: "token");
    url = formater(url);
    var response = await http.get(url, headers: {"Authorization": "Bearer $token"});
    if(response.statusCode == 200 || response.statusCode == 201){
      log.i(response.body);
      return json.decode(response.body);
    }
    log.i(response.body);
    log.i(response.statusCode);
  }

  Future<http.Response> post(String url, Map<String, String> body) async{
    String token = await storage.read(key: "token");
    url = formater(url);
    log.d(body);
    var res = await http.post(url,
        headers: {"Content-type": "application/json", "Authorization": "Bearer $token"},
        body: json.encode(body));
    return res;
  }

  String formater(String url){
    return baseUrl + url;
  }
}