import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carental/car/car.dart';
import 'package:carental/car/screens/car_add_update.dart';

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
              arguments: CarArgument(car: car, edit: true),
            ),
          ),
          SizedBox(
            width: 32,
          ),
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                context.read<CarBloc>().add(CarDelete(car));
                Navigator.of(context).pushNamedAndRemoveUntil(
                    CarList.routeName, (route) => false);
              }),
        ],
      ),
      body: Card(
        child: Column(
          children: [
            ListTile(
              title: Text('Car brand: ${this.car.brand}', style: TextStyle(fontSize: 20),),
              subtitle: Text('Car model: ${this.car.model}', style: TextStyle(fontSize: 20)),
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
            Text("2 weeks cost of: ${this.car.price.toString()}", style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
