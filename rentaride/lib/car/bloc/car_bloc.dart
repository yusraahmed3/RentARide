import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentaride/car/bloc/bloc.dart';
import 'package:rentaride/car/car.dart';

class CarBloc extends Bloc<CarEvent, CarState>{
  final CarRepository carsRepository;
  CarBloc({ this.carsRepository}):assert(carsRepository !=null),super(CarLoading());

  @override
  Stream<CarState> mapEventToState(CarEvent event)async*{
    if(event is CarLoad){
      yield CarLoading();
      try{
        print("Sucess");
         final cars = await carsRepository.getCars();
        yield CarLoadSuccess(cars);

      }
      catch(e){
        print(e);
        yield CarOperationFailure();
      }
    }
    if (event is CreateCar){
      try{
        await carsRepository.addCar(event.car);
        final cars = await carsRepository.getCars();
        yield CarLoadSuccess(cars);
      } catch(_){yield CarOperationFailure();
      }
    }
    if(event is CarUpdate) {
      try{
        await carsRepository.updateCar(event.car);
        final cars = await carsRepository.getCars();
        yield CarLoadSuccess(cars);
      }catch(_){
        yield CarOperationFailure();
      }
    }
    if (event is CarDelete) {
      try {
        await carsRepository.deleteCar(event.car.model);
        final cars = await carsRepository.getCars();
        yield CarLoadSuccess(cars);
      } catch (_) {
        yield CarOperationFailure();
      }
    }

  }
}