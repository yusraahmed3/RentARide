<<<<<<< HEAD
import 'package:carental/car.dart';
import 'package:equatable/equatable.dart';
import 'package:carental/models/models.dart';
class RentedCarState extends Equatable {
  const RentedCarState();

  @override
  List<Object> get props => [];
}

class RentedCarLoading extends RentedCarState {}

class RentedCarLoadSuccess extends RentedCarState {
  final List<RentedCarModel> rentedcars;

  RentedCarLoadSuccess([this.rentedcars = const []]);

  @override
  List<Object> get props => [rentedcars];
}

class RentedCarOperationFailure extends RentedCarState {}
=======
import 'package:carental/car.dart';
import 'package:equatable/equatable.dart';
import 'package:carental/models/models.dart';
class RentedCarState extends Equatable {
  const RentedCarState();

  @override
  List<Object> get props => [];
}

class RentedCarLoading extends RentedCarState {}

class RentedCarLoadSuccess extends RentedCarState {
  final List<RentedCarModel> rentedcars;

  RentedCarLoadSuccess([this.rentedcars = const []]);

  @override
  List<Object> get props => [rentedcars];
}

class RentedCarOperationFailure extends RentedCarState {}
>>>>>>> df38bf5c95ab1e95885235221be9b87d963ecc3d
