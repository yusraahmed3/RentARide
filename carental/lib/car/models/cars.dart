import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';






@immutable
class CarModel  extends Equatable{

  final String brand;
  final String model;
  final int price;
  final String period;
  // final String image;

  CarModel({
    @required this.brand,
    @required this.model,
    @required this.price, @required this.period});

  @override
  List<Object> get props => [ brand, model, price, period];

  factory CarModel.fromJson(Map<String, dynamic> json){
    return CarModel(
      brand: json['brand'],
      model: json['model'],
      price: json['price'],
      period: json['period'],
      // image: json['image'],
    );
  }

  @override
  String toString() => 'CarModel { brand: $brand, model: $model, price: $price, period: $period}';
}







