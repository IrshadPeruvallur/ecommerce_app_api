import 'package:flutter/material.dart';
import 'package:ecommerce_api/model/product_model.dart';
import 'package:ecommerce_api/service/prodect_service.dart';

class ProductProvider extends ChangeNotifier {
  ProductService apiService = ProductService();
  List<ProductModel> prodectList = [];

  getData() async {
    try {
      prodectList = await apiService.getData();
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
