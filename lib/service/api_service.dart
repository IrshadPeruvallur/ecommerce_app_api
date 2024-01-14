import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce_api/model/app_model.dart';

class ApiService {
  final url = 'http://localhost:9000/api/users/products';
  Dio dio = Dio();

  Future<List<AppModel>> getData() async {
    try {
      final response = await dio.get(url);
      log('URL: $url');
      log('Response: ${response.data}');

      if (response.statusCode == 200) {
        final jsonData = response.data;

        if (jsonData is Map<String, dynamic> &&
            jsonData.containsKey('data') &&
            jsonData['data'] is Map<String, dynamic> &&
            jsonData['data'].containsKey('allProducts')) {
          final List<dynamic> allProducts = jsonData['data']['allProducts'];
          return allProducts
              .map((product) => AppModel.fromJson(product))
              .toList();
        } else {
          throw Exception('Invalid response structure');
        }
      } else {
        print('Failed to load. Status code: ${response.statusCode}');
        throw Exception('Failed to load');
      }
    } catch (e) {
      print('Error in ApiService: $e');
      throw e;
    }
  }
}
