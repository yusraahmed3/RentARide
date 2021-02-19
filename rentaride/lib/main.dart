 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentaride/car/car.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:rentaride/user/bloc/bloc.dart';
// import 'package:rentaride/user/data_provider/data_provider.dart';
// import 'package:rentaride/user/repository/repository.dart';
// import 'package:rentaride/user/screens/screens.dart';
// import 'bloc_observer.dart';
// import 'user/screens/Welcome.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;



void main() {
  Bloc.observer = SimpleBlocObserver();

  final CarRepository carRepository = CarRepository(
      dataProvider: CarDataProvider()
  );
  runApp(
    RentARide(carRepository: carRepository),
  );

}

class RentARide extends StatelessWidget {
  final CarRepository carRepository;

  RentARide({@required this.carRepository}) : assert(carRepository != null);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: this.carRepository,
      child: BlocProvider(
        create: (context) =>
        CarBloc(carsRepository: this.carRepository)
          ..add(CarLoad()),
        child: MaterialApp(
          title: 'Rent-A-Ride',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          onGenerateRoute: CarAppRoute.generateRoute,
        ),
      ),
    );
  }
}