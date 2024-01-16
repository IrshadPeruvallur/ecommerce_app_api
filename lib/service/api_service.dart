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
}
