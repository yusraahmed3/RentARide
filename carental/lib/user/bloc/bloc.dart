import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carental/user/bloc/user_event.dart';
import 'package:carental/user/repository/user_repo.dart';

import 'package:carental/user/bloc/user_state.dart';

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