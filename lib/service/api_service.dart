import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce_api/model/app_model.dart';

class ApiService {
  final url = 'http://localhost:9000/api/users/products';
  Dio dio = Dio();

  Future<List<AllProducts>> getData() async {
    try {
      final response = await dio.get(url);
      log('URL: $url');
      log('Response: ${response.data}');

      if (response.statusCode == 200) {
        final dataApi = DataApi.fromJson(response.data);
        if (dataApi.data != null && dataApi.data!.allProducts != null) {
          return dataApi.data!.allProducts!;
        } else {
          throw Exception('Invalid response structure');
        }
      } else {
        print('Failed to load. Status code: ${response.statusCode}');
        throw Exception('Failed to load');
      }
    } catch (e) {
      print('Error: $e');
      throw e;
    }
  }
}
