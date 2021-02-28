import 'package:equatable/equatable.dart';
import 'package:carental/car/car.dart';


abstract class CarEvent extends Equatable{
  const CarEvent();
}

class CarLoad extends CarEvent{
  const CarLoad();

  @override
  List<Object> get props =>[];
  @override
  String toString()=>'Car get{car}}';
}

class CreateCar extends CarEvent{
  final CarModel car;
  const CreateCar(this.car);

  @override
  List<Object> get props => [car];
  @override
  String toString()=>'Car Created{car:$car}';
}
class CarUpdate extends CarEvent{
  final CarModel car;
  const CarUpdate(this.car);
  @override
  List<Object> get props => [car];

  @override
  String toString()=>'Car Update {car:$car}';
}
class CarDelete extends CarEvent {
  final CarModel car;

  const CarDelete(this.car);

  @override
  List<Object> get props => [car];

  @override
  toString() => 'Car Deleted {car: $car}';
}
