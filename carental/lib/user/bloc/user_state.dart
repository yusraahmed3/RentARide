import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class AdminLoadSuccess extends UserState{
  String text = 'Admin Load';

  AdminLoadSuccess({this.text});
  @override
  List<Object> get props => [text];
}

class UserLoading extends UserState {}

class UserLoadSuccess extends UserState {
  String text = "Load Success";

   UserLoadSuccess([this.text]);

  @override
  List<Object> get props => [text];
}

class UserOperationFailure extends UserState {}
