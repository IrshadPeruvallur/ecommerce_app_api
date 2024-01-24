import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:ecommerce_api/model/user_model.dart';
import 'package:ecommerce_api/service/store.dart';

class UserService {
  String? userStatusCode;
  String? createdStatusCode;
  Dio dio = Dio();
  StoreService store = StoreService();

  createUser(UserModel userInfo) async {
    const url = 'http://localhost:9000/api/users/register';
    try {
      Response response = await dio.post(url, data: userInfo.toJson());
      createdStatusCode = response.statusCode.toString();

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
    const url = 'http://localhost:9000/api/users/login';
    try {
      Response response = await dio.post(url, data: userInfo.toJson());
      userStatusCode = response.statusCode.toString();

      if (response.statusCode == 200) {
        log('User Logged in');
        final tokenId = response.data['token'];
        final userId = response.data['user']['_id'];
        final username = response.data['user']['username'];
        final email = response.data['user']['email'];

        store.setKeys('tokenId', tokenId);
        store.setKeys('userId', userId);
        store.setKeys('username', username);
        store.setKeys('email', email);
        // store.setUserId(userId);+-
      } else if (response.statusCode == 500) {
        log('User login failed');
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
