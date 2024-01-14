import 'package:ecommerce_api/model/app_model.dart';
import 'package:ecommerce_api/service/api_service.dart';
import 'package:flutter/material.dart';

class DataProvider extends ChangeNotifier {
  ApiService _apiService = ApiService();
  List<AllProducts> prodectList = [];

  getData() async {
    prodectList = await _apiService.getData();
    notifyListeners();
  }
}
