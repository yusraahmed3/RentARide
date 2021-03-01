import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:carental/screens/screens.dart';

class UserRoute {
  static Route generateRoute(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(builder: (context) => Welcome());
    }
    if (settings.name == SignUp.routeName) {
      return MaterialPageRoute(
          builder: (context) => SignUp());
    }
    if (settings.name == CarList.routeName) {
      return MaterialPageRoute(
          builder: (context) => CarList());
    }

  }
}