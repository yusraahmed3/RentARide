import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class User extends Equatable {

  User({ this.id, @required this.username, @required this.email, @required this.password});

  final String id;
  final String username;
  final String email;
  final String password;

  @override
  List<Object> get props => [id, username, email, password];

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      password: json['password'],
    );
  }

  @override
  String toString() => 'User {id: $id, username: $username, email: $email, password: $password}';
}