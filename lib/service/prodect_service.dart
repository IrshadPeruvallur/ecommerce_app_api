import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce_api/model/product_model.dart';

class ApiService {
  Dio dio = Dio();
  Future<List<ProductModel>> getData() async {
    final url = 'http://localhost:9000/api/users/products';
    try {
      final response = await dio.get(url);
      log('URL: $url');

      if (response.statusCode == 200) {
        final jsonData = response.data;
        final List<dynamic> allProducts = jsonData['data']['allProducts'];
        return allProducts
            .map((product) => ProductModel.fromJson(product))
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
