import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carental/bloc/user_event.dart';
import 'package:carental/bloc/bloc.dart';
import 'package:carental/repository/repository.dart';

class UserBloc extends Bloc<UserEvent, UserState>{
  UserRepo userRepo;
  UserBloc({ this.userRepo}) : super(UserLoading());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if(event is UserLoggedOut){
      try{
        yield UserLoading();
      }
      catch(e){
        yield UserOperationFailure();
      }
    }
    if(event is UserLogIn){
      try{
        await userRepo.loginUser(event.user);
        yield UserLoadSuccess();
      }catch(e){
        yield UserOperationFailure();
      }
    }
    if(event is UserSignUp){
      try{
        await userRepo.loginUser(event.user);
        yield UserLoadSuccess();
      }catch(e){
        yield UserOperationFailure();
      }
    }
  }


}