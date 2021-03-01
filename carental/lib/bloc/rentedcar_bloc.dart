import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carental/bloc/bloc.dart';
import 'package:carental/repository/repository.dart';

class RentedCarBloc extends Bloc<RentedCarEvent, RentedCarState>{
  final  RentedCarRepository rentedcarsRepository;
  RentedCarBloc({ this.rentedcarsRepository}):assert(rentedcarsRepository !=null),super(RentedCarLoading());

  @override
  Stream<RentedCarState> mapEventToState(RentedCarEvent event)async*{
    if(event is RentedCarLoad){
      yield RentedCarLoading();
      try{
        print("Sucess");
         final cars = await rentedcarsRepository.getRentedCars();
        yield RentedCarLoadSuccess(cars);

      }
      catch(e){
        print(e);
        yield RentedCarOperationFailure();
      }
    }
    if (event is CreateRentedCar){
      try{
        await rentedcarsRepository.createRentedCar(event.rentedcar);
        final rentedcars = await rentedcarsRepository.getRentedCars();
        yield RentedCarLoadSuccess(rentedcars);
      } catch(_){yield RentedCarOperationFailure();
      }
    }
    if(event is RentedCarUpdate) {
      try{
        await rentedcarsRepository.updateRentedCar(event.rentedcar);
        final rentedcars = await rentedcarsRepository.getRentedCars();
        yield RentedCarLoadSuccess(rentedcars);
      }catch(_){
        yield RentedCarOperationFailure();
      }
    }
    if (event is RentedCarDelete) {
      try {
        await rentedcarsRepository.deleteRentedCar(event.rentedcar.model);
        final rentedcars = await rentedcarsRepository.getRentedCars();
        yield RentedCarLoadSuccess(rentedcars);
      } catch (_) {
        yield RentedCarOperationFailure();
      }
    }

  }
}