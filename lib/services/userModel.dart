import 'package:brainbatu/models/user.dart';
import 'package:flutter/foundation.dart';

class UserProvider extends ChangeNotifier {
  User _user;

  User get user => _user;
  setUser(User user) {
    _user = user;
    // notifyListeners();
  }
}
