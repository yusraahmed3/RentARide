import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentaride/car/car.dart';
import 'package:rentaride/car/screens/car_add_update.dart';

class CarDetail extends StatelessWidget{
  static const routeName='courseDetail';
  final CarModel car;
  CarDetail({@required this.car});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${this.car.brand}'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () => Navigator.of(context).pushNamed(
              AddUpdateCar.routeName,
              arguments: CarArgument(car: this.car, edit: true),
            ),
          ),
          SizedBox(
            width: 32,
          ),
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                context.read<CarBloc>().add(CarDelete(this.car));
                Navigator.of(context).pushNamedAndRemoveUntil(
                    CarList.routeName, (route) => false);
              }),
        ],
      ),
      body: Card(
        child: Column(
          children: [
            ListTile(
              title: Text('Title: ${this.car.brand}'),
              subtitle: Text('ECTS: ${this.car.model}'),
            ),
            Text(
              'Details',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(this.car.price.toString()),
          ],
        ),
      ),
    );
  }
}
