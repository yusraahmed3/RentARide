<<<<<<< HEAD
import 'package:meta/meta.dart';
import 'package:carental/repository/repository.dart';
import 'package:carental/models/models.dart';
import 'package:carental/data_provider/data_provider.dart';

class RentedCarRepository {
  final RentedCarProvider rentedarProvider;

  RentedCarRepository({@required this.rentedarProvider})
      : assert(rentedarProvider != null);

  Future<RentedCarModel> createRentedCar(CarModel car, User user) async {
    return await rentedarProvider.createRentedCar(car, user);
  }

  Future<List<RentedCarModel>> getRentedCars() async {
    print("In repo ");
    return await rentedarProvider.getRentedCars();
  }

  Future<void> updateRentedCar(RentedCarModel car) async {
    await rentedarProvider.updateCar(car);
  }
  //
  // Future<void> addImage(String url, String filepath) async{
  //   await dataProvider.patchImage(url, filepath);
  // }

  Future<void> deleteRentedCar(String model) async {
    await rentedarProvider.cancelRentedCar(model);
  }
}
=======
import 'package:meta/meta.dart';
import 'package:carental/repository/repository.dart';
import 'package:carental/models/models.dart';
import 'package:carental/data_provider/data_provider.dart';

class RentedCarRepository {
  final RentedCarProvider rentedarProvider;

  RentedCarRepository({@required this.rentedarProvider})
      : assert(rentedarProvider != null);

  Future<RentedCarModel> createRentedCar(RentedCarModel car) async {
    return await rentedarProvider.createRentedCar(car);
  }

  Future<List<RentedCarModel>> getRentedCars() async {
    print("In repo ");
    return await rentedarProvider.getRentedCars();
  }

  Future<void> updateRentedCar(RentedCarModel car) async {
    await rentedarProvider.updateCar(car);
  }
  //
  // Future<void> addImage(String url, String filepath) async{
  //   await dataProvider.patchImage(url, filepath);
  // }

  Future<void> deleteRentedCar(String model) async {
    await rentedarProvider.deleteRentedCar(model);
  }
}
>>>>>>> df38bf5c95ab1e95885235221be9b87d963ecc3d
