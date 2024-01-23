import 'package:ecommerce_api/model/user_model.dart';
import 'package:ecommerce_api/service/store.dart';
import 'package:ecommerce_api/service/user_service.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final UserService _userService = UserService();
  final StoreService _storeService = StoreService();
  String? userStatusCode;
  String? createdStatusCode;
  String username = '';
  String email = '';
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

  setUserData() async {
    username = await _storeService.getValues('username');
    email = await _storeService.getValues('email');
    notifyListeners();
  }
}
