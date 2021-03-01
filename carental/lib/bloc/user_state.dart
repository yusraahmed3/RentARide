import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carental/models/models.dart';


class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class AdminLoadSuccess extends UserState{
final User user;
  AdminLoadSuccess({this.user});
  @override
  List<Object> get props => [user];
}

class UserLoading extends UserState {}

class UserLoadSuccess extends UserState {
  String text = "Load Success";

   UserLoadSuccess([this.text]);

  @override
  List<Object> get props => [text];
}

class UserOperationFailure extends UserState {}
