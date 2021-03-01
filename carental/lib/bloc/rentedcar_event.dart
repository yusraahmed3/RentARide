<<<<<<< HEAD
import 'package:carental/car.dart';
import 'package:equatable/equatable.dart';
import 'package:carental/bloc/bloc.dart';

abstract class RentedCarEvent extends Equatable {
  const RentedCarEvent();
}

class RentedCarLoad extends CarEvent {
  const RentedCarLoad();

  @override
  List<Object> get props => [];
  @override
  String toString() => 'Car get{car}}';
}

class CreateRentedCar extends RentedCarEvent {
  final RentedCarModel rentedcar;
  const CreateRentedCar(this.rentedcar);

  @override
  List<Object> get props => [rentedcar];
  @override
  String toString() => 'Rented Car Created{car:$rentedcar}';
}

class RentedCarUpdate extends RentedCarEvent {
  final RentedCarModel rentedcar;
  const RentedCarUpdate(this.rentedcar);
  @override
  List<Object> get props => [rentedcar];

  @override
  String toString() => 'Car Update {rentedcar:$rentedcar}';
}

class RentedCarDelete extends RentedCarEvent {
  final RentedCarModel rentedcar;

  const RentedCarDelete(this.rentedcar);

  @override
  List<Object> get props => [rentedcar];

  @override
  toString() => 'Rented Car Deleted {car: $rentedcar}';
}
=======
import 'package:carental/car.dart';
import 'package:equatable/equatable.dart';
import 'package:carental/bloc/bloc.dart';

abstract class RentedCarEvent extends Equatable {
  const RentedCarEvent();
}

class RentedCarLoad extends CarEvent {
  const RentedCarLoad();

  @override
  List<Object> get props => [];
  @override
  String toString() => 'Car get{car}}';
}

class CreateRentedCar extends RentedCarEvent {
  final RentedCarModel rentedcar;
  const CreateRentedCar(this.rentedcar);

  @override
  List<Object> get props => [rentedcar];
  @override
  String toString() => 'Rented Car Created{car:$rentedcar}';
}

class RentedCarUpdate extends RentedCarEvent {
  final RentedCarModel rentedcar;
  const RentedCarUpdate(this.rentedcar);
  @override
  List<Object> get props => [rentedcar];

  @override
  String toString() => 'Car Update {rentedcar:$rentedcar}';
}

class RentedCarDelete extends RentedCarEvent {
  final RentedCarModel rentedcar;

  const RentedCarDelete(this.rentedcar);

  @override
  List<Object> get props => [rentedcar];

  @override
  toString() => 'Rented Car Deleted {car: $rentedcar}';
}
>>>>>>> df38bf5c95ab1e95885235221be9b87d963ecc3d
