import 'package:carental/models/models.dart';
import 'package:carental/data_provider/data_provider.dart';
import 'package:meta/meta.dart';

class AuthRepo {
  final AuthDataProvider authDataProvider;
  AuthRepo({@required this.authDataProvider})
      : assert(authDataProvider != null);

  Future<Auth> loginUser(Auth auth) async {
    return authDataProvider.loginUser(auth);
  }
}
