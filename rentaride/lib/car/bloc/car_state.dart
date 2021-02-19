import 'package:equatable/equatable.dart';
import 'package:rentaride/car/car.dart';

class CarState extends Equatable {
  const CarState();

  @override
  List<Object> get props => [];
}

class CarLoading extends CarState {}

class CarLoadSuccess extends CarState {
  final List<CarModel> cars;

  CarLoadSuccess([ this.cars = const []]);

  @override
  List<Object> get props => [cars];
}

class CarOperationFailure extends CarState {}
