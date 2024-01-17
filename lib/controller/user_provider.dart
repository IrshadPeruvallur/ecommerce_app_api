import 'dart:developer';

import 'package:ecommerce_api/model/user_model.dart';
import 'package:ecommerce_api/service/user_service.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final UserService _userService = UserService();
  String? userStatusCode;
  String? createdStatusCode;
  createUser(UserModel userInfo) async {
    await _userService.createUser(userInfo);
    createdStatusCode = _userService.createdStatusCode;
    notifyListeners();
  }

  userLogin(UserModel userInfo) async {
    await _userService.userLogin(userInfo);
    userStatusCode = _userService.userStatusCode;
    notifyListeners();
  }
}
