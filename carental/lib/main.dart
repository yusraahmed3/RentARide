//
// import 'package:carental/user/bloc/bloc.dart';
// import 'package:carental/user/bloc/user_event.dart';
// import 'package:carental/user/data_provider/user_data.dart';
// import 'package:carental/user/model/user.dart';
import 'package:carental/user/bloc/bloc.dart';
import 'package:carental/user/bloc/user_event.dart';
import 'package:carental/user/repository/user_repo.dart';
import 'package:carental/user/screens/Welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carental/car/car.dart';
import 'bloc_observer.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  final CarRepository carRepository = CarRepository(
      dataProvider: CarDataProvider()
  );

  runApp(

    RentARide(carRepository: carRepository,),

  );

}

class RentARide extends StatelessWidget {
  final CarRepository carRepository;

  RentARide({@required this.carRepository}) : assert(carRepository != null);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Welcome()
    );
  }
}
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
// }