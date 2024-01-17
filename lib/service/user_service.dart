import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce_api/model/app_model.dart';
import 'package:ecommerce_api/model/user_model.dart';
import 'package:ecommerce_api/view/login_pages/login.dart';

class UserService {
  String? userStatusCode;
  Dio dio = Dio();

  createUser(UserModel userInfo) async {
    final url = 'http://localhost:9000/api/users/register';
    try {
      Response response = await dio.post(url, data: userInfo.toJson());
      if (response.statusCode == 201) {
        log('Account created');
      } else {
        log("Account not created. Status code: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      log("$e");
      return null;
    }
  }

  userLogin(UserModel userInfo) async {
    final url = 'http://localhost:9000/api/users/login';
    try {
      Response response = await dio.post(url, data: userInfo.toJson());
      userStatusCode = response.statusCode.toString();

      if (response.statusCode == 200) {
        log('User Logged in');
        tokenId = response.data['token'];
        log('_id : ${response.data['_id']}');
      } else if (response.statusCode == 500) {
        log('User login failed');
        return null;
      }
    } catch (e) {
      throw e;
    }
  }
}
