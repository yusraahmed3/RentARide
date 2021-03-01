import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:carental/models/models.dart';
import 'package:carental/data_provider/data_provider.dart';

import 'package:http/http.dart' as http;

class RentedCarProvider{
  final _baseUrl = 'http://10.2.2.2:3000';


  Future<RentedCarModel>createRentedCar(CarModel car, User user) async{
    final response = await http.post(formater('/rentcar/createRentedCar'),
    headers:<String, String>{
      'content-Type':'application/json; charset=UTF-8',
    },
    body:jsonEncode(<String, dynamic>{
      'name':user.username,
      'Car':car.model,
        'price': car.price,

    }),
    );
    if (response.statusCode ==200){
      return RentedCarModel.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('Failed to create rented car.');
    }
  }
   Future<List<RentedCarModel>> getRentedCars() async {

    final response = await http.get(formater('/rentcar/getRentedCar'));
    print(response.body);

    if (response.statusCode == 200) {
      print("in");
      final rentcars = jsonDecode(response.body) as List;
      print(rentcars);
      //final tempcar =  cars['data'];
      return rentcars;
    } else {
      throw Exception('Failed to load rent cars');
    }
  }/////////
    Future<void> cancelRentedCar(String model) async {
    final http.Response response = await http.delete(formater('/rentcar/delete/$model'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete car.');
    }
  }
 Future<void> updateCar(RentedCarModel rentcar) async {
    final http.Response response = await http.put(formater('/car/${car.model}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'userid':user.id,
      'id':rentedcar.id,
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