import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc_observer.dart';
import 'package:http/http.dart' as http;
import 'package:carental/car.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();

<<<<<<< HEAD
  final UserRepo userRepo = UserRepo(dataProvider: UserDataProvider(
    httpClient: http.Client(),
  ));
=======
  final UserRepo userRepo = UserRepo(dataProvider: UserDataProvider());
>>>>>>> ab8f701ebcd2b2a2dd59c7963b2e6ae205f3bd96

  final CarRepository carRepository = CarRepository(
      dataProvider: CarDataProvider()
  );

  runApp(

    RentARide(carRepository: carRepository, userRepo: userRepo,),

  );

}

class RentARide extends StatelessWidget {
  final CarRepository carRepository;
  final UserRepo userRepo;

  RentARide({@required this.carRepository, @required this.userRepo})
      : assert(carRepository != null);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider.value(value: this.userRepo),
          RepositoryProvider.value(value: this.carRepository),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
            create: (context) => UserBloc(userRepo: this.userRepo)),
    BlocProvider(
    create: (context) => CarBloc(carsRepository: this.carRepository)),
          ],
    child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          onGenerateRoute: UserRoute.generateRoute,
        )));
  }
//     return MaterialApp(
//         home: Welcome()
//     );
//   }
// }
//     return Welcome RepositoryProvider.value(
//       value: this.carRepository,
//       child: BlocProvider(
//         create: (context) =>
//         CarBloc(carsRepository: this.carRepository)
//           ..add(CarLoad()),
//         child: MaterialApp(
//           title: 'Rent-A-Ride',
//           theme: ThemeData(
//             primarySwatch: Colors.blue,
//             visualDensity: VisualDensity.adaptivePlatformDensity,
//           ),
//           onGenerateRoute: CarAppRoute.generateRoute,
//         ),
//       ),
//     );
//   }
}
