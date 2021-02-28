import 'package:meta/meta.dart';
import 'package:carental/user/data_provider/user_data.dart';
import 'package:carental/user/model/user.dart';

class UserRepo {
  final UserDataProvider dataProvider;
  User _user;

  UserRepo({@required this.dataProvider})
      : assert(dataProvider != null);

  // Future<User> getUser() async {
  //   if(_user != null) return _user;
  //   return Future.delayed(
  //     const Duration(milliseconds: 300),
  //       ()=> _user = User(Uuid().v4()),
  //   )
  // }

  Future<User> loginUser(User user) async {
    return await dataProvider.LogIn(user);
  }

  Future<User> signUp(User user) async {
    return await dataProvider.SignUp(user);
  }


}