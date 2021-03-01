import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';


@immutable
class RentedCarModel extends Equatable {
  final String brand;
  final String model;
  final int price;
  final String rentperiod;
  // final String image;

  RentedCarModel(
      {@required this.brand,
      @required this.model,
      @required this.price,
      @required this.rentperiod});

  @override
  List<Object> get props => [brand, model, price, rentperiod];

  factory RentedCarModel.fromJson(Map<String, dynamic> json) {
    return RentedCarModel(
      //userid:json['userid']
      brand: json['brand'],
      model: json['model'],
      price: json['price'],
      rentperiod: json['rentperiod'],
      // image: json['image'],
    );
  }

  @override
  String toString() =>
      'CarModel { brand: $brand, model: $model, price: $price, rentperiod: $rentperiod}';
}
