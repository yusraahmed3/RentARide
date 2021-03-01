import 'package:equatable/equatable.dart';
import 'package:carental/models/models.dart';

class CarState extends Equatable {
  const CarState();

  @override
  List<Object> get props => [];
}

class CarLoading extends CarState {}

class CarLoadSuccess extends CarState {
  final List<CarModel> carss;

  const CarLoadSuccess(this.carss);

  @override
  List<Object> get props => [carss];
}

class CarOperationFailure extends CarState {}
