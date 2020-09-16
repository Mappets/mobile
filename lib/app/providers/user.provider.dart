import 'package:mobile/app/interfaces/user.interface.dart';

class UserProvider {
  User user;
  static UserProvider instance;

  static get getInstance {
    if (instance == null) instance = UserProvider();

    return instance;
  }
}
