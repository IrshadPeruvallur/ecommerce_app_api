import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce_api/model/app_model.dart';
import 'package:ecommerce_api/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  Dio dio = Dio();
  Future<List<AppModel>> getData() async {
    final url = 'http://localhost:9000/api/users/products';
    try {
      final response = await dio.get(url);
      log('URL: $url');

      if (response.statusCode == 200) {
        final jsonData = response.data;
        final List<dynamic> allProducts = jsonData['data']['allProducts'];
        return allProducts
            .map((product) => AppModel.fromJson(product))
            .toList();
      } else {
        log('Failed to load. Status code: ${response.statusCode}');
        throw Exception('Failed to load');
      }
    } catch (e) {
      log('Error in ApiService: $e');
      throw e;
    }
  }

  createUser(UserModel userInfo) async {
    final url = 'http://localhost:9000/api/users/register';
    try {
      Response response = await dio.post(url, data: userInfo.toJosn());
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
}
