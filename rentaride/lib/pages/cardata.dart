// import 'package:equatable/equatable.dart';
// import 'package:json_annotation/json_annotation.dart';
// import 'package:flutter/material.dart';
//
// import 'package:rentaride/NetworkHandler.dart';
//
//
//
//
// @immutable
// class CarModel  extends Equatable{
//
//   final String brand;
//   final String model;
//   final double price;
//   final String rentperiod;
//   final String image;
//
//   CarModel({@required this.brand, @required this.model, @required this.price, @required this.rentperiod, @required this.image});
//
//   @override
//   // TODO: implement props
//   List<Object> get props => [brand, model, price, rentperiod, image];
//
//   factory CarModel.fromJson(Map<String, dynamic> json){
//     return CarModel(
//       brand: json['brand'],
//       model: json['model'],
//       price: json['price'],
//       rentperiod: json['rentperiod'],
//       image: json['image'],
//     );
//   }
//
//
// }
//
//
//
//
//
//
//
