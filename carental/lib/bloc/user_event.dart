import 'package:equatable/equatable.dart';
import 'package:carental/models/models.dart';


abstract class UserEvent extends Equatable {
  const UserEvent();
}

class StartEvent extends UserEvent{
  @override

  List<Object> get props => [];

}

class UserLogIn extends UserEvent{
  final User user;

  const UserLogIn(this.user);

  @override
  List<Object> get props => [user];

}

class UserSignUp extends UserEvent{
  final User user;

  const UserSignUp(this.user);

  @override
  List<Object> get props => [user];

}