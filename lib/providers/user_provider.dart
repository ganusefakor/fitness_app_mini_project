import 'package:flutter/material.dart';

import '../model/user_model.dart';


class UserProvider extends ChangeNotifier {
  UserModel _user =
      UserModel(email: '', uid: '', password: '', dataeOfBith: '', firstname: '', gender: '', height: 0, lastname: '', weight: 0);

  UserModel get getUser => _user;
  setUserData(UserModel user) {
    _user = user;
    notifyListeners();
  }
}