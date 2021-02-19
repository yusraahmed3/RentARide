import 'package:flutter/material.dart';
import 'package:rentaride/car/car.dart';
import 'package:rentaride/car/screens/car_add_update.dart';
import 'package:rentaride/car/models/cars.dart';

class CarAppRoute {
  static Route generateRoute(RouteSettings settings) {
    if (settings.name == '/') {
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
