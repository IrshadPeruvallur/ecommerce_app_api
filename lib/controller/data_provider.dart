import 'package:flutter/material.dart';
import 'package:ecommerce_api/model/app_model.dart';
import 'package:ecommerce_api/service/api_service.dart';

class DataProvider extends ChangeNotifier {
  ApiService _apiService = ApiService();
  List<AppModel> prodectList = [];

  getData() async {
    try {
      prodectList = await _apiService.getData();
      notifyListeners();
    } catch (e) {
      print('Error in DataProvider: $e');
    }
  }
}
