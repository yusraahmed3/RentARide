import 'package:flutter/material.dart';
import 'package:carental/screens/screens.dart';
import 'package:carental/models/models.dart';

class CarAppRoute {
  static Route generateRoute(RouteSettings settings) {
    if (settings.name == '/carlist') {
      return MaterialPageRoute(builder: (context) => CarList());
    }

    if (settings.name == AddUpdateCar.routeName) {
      CarArgument args = settings.arguments;
      return MaterialPageRoute(
          builder: (context) => AddUpdateCar(
            args: args,
          ));
    }

    if (settings.name == CarDetail.routeName) {
      CarModel car = settings.arguments;
      return MaterialPageRoute(
          builder: (context) => CarDetail(
            car: car,
          ));
    }

    return MaterialPageRoute(builder: (context) => CarList());
  }
}

class CarArgument {
  final CarModel car;
  final bool edit;
  CarArgument({this.car, this.edit});
}
