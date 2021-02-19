import 'dart:convert';
import 'package:rentaride/car/models/models.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

class CarDataProvider {
  final _baseUrl = "http://10.0.2.2:5000";


  Future<CarModel> addCar(CarModel car) async{
    final response = await http.post(formater('/car/addCar'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'brand': car.brand,
        'model': car.model,
        'price': car.price,
        'rentperiod': car.rentperiod,
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
      print(cars);
      //final tempcar =  cars['data'];
      return cars;
    } else {
      throw Exception('Failed to load cars');
    }
  }

  Future<void> deleteCar(String model) async {
    final http.Response response = await http.delete(formater('/car/delete/$model'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete car.');
    }
  }

  Future<void> updateCar(CarModel car) async {
    final http.Response response = await http.put(formater('/car/${car.model}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'brand': car.brand,
        'model': car.model,
        'price': car.price,
        'rentperiod': car.rentperiod,
        // 'image': car.image,
      }),
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to update car.');
    }
  }




  String formater(String url){
    return _baseUrl + url;
  }
}