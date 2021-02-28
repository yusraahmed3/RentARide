import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:carental/car/screens/car_list.dart';
import 'package:carental/user/screens/SignUp.dart';
import 'package:carental/user/screens/Welcome.dart';

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