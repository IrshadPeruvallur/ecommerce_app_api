import 'package:ecommerce_api/model/user_model.dart';
import 'package:ecommerce_api/service/user_service.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  UserService _userService = UserService();

  String? userStatusCode;
  createUser(UserModel userInfo) async {
    await _userService.createUser(userInfo);
    notifyListeners();
  }

  userLogin(UserModel userInfo) async {
    await _userService.userLogin(userInfo);
    userStatusCode = _userService.userStatusCode;
    notifyListeners();
  }
}
