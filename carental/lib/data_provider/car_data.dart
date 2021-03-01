import 'dart:convert';
import 'package:carental/models/models.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

class CarDataProvider {
<<<<<<< HEAD:carental/lib/data_provider/car_data.dart
  final _baseUrl = "http://10.6.198.36:5000";
=======
  final _baseUrl = "http://10.2.2.2:5000";
>>>>>>> ab8f701ebcd2b2a2dd59c7963b2e6ae205f3bd96:carental/lib/car/data_provider/car_data.dart


  Future<CarModel> addCar(CarModel car) async{
    final response = await http.post(formater('/car/addCar'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'brand': car.brand,
        'model': car.model,
        'price': car.price,
        'period': car.period,
        // 'image': car.image,
      }),
    );
    if (response.statusCode == 200) {
      return CarModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to add car.');
    }
  }

  // Future<http.StreamedResponse>patchImage(String url, String filepath) async{
  // url = formater(url);
  // var request = http.MultipartRequest('PATCH', Uri.parse(url));
  // request.files.add(await http.MultipartFile.fromPath("img", filepath));
  //  request.headers.addAll({
  //    "Content-type": "multipart/form-data",
  //  });
  //  var response = request.send();
  //  return response;
  // }

  Future<List<CarModel>> getCars() async {

    final response = await http.get(formater('/car/getData'));
    print(response.body);

    if (response.statusCode == 200) {
      print("in");
      final cars = jsonDecode(response.body) as List;
      print(cars[0]['_id']);
      return cars.map((car) => CarModel.fromJson(car)).toList();
    } else {
      throw Exception('Failed to load cars');
    }
  }

  Future<void> deleteCar(String id) async {
    final http.Response response = await http.delete(formater('/car/delete/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete car.');
    }
  }

  Future<void> updateCar(CarModel car) async {
    final http.Response response = await http.put(formater('/car/update/${car.model}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'brand': car.brand,
        'model': car.model,
        'price': car.price,
        'period': car.period,
        // 'image': car.image,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update car.');
    }
  }




  String formater(String url){
    return _baseUrl + url;
  }
}