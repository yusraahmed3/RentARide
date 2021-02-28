import 'package:meta/meta.dart';
import 'package:carental/car/car.dart';

class CarRepository {
  final CarDataProvider dataProvider;

  CarRepository({@required this.dataProvider})
      : assert(dataProvider != null);

  Future<CarModel> addCar(CarModel car) async {
    return await dataProvider.addCar(car);
  }

  Future<List<CarModel>> getCars() async {
    print("In repo ");
    return await dataProvider.getCars();
  }

  Future<void> updateCar(CarModel car) async {
    await dataProvider.updateCar(car);
  }
  //
  // Future<void> addImage(String url, String filepath) async{
  //   await dataProvider.patchImage(url, filepath);
  // }

  Future<void> deleteCar(String model) async {
    await dataProvider.deleteCar(model);
  }
}
