import 'package:ecommerce_api/controller/product_provider.dart';
import 'package:ecommerce_api/model/product_model.dart';
import 'package:ecommerce_api/service/prodect_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchProvider extends ChangeNotifier {
  ProductService productService = ProductService();
  TextEditingController searchController = TextEditingController();
  List<ProductModel> searchedList = [];
  loadProducts() async {
    final allData = await productService.getData();
    searchedList = allData;
    notifyListeners();
  }

  search(String enterName, context) {
    final getPrvdr = Provider.of<ProductProvider>(context, listen: false);
    if (enterName.isEmpty) {
      searchedList = [...getPrvdr.prodectList];
    } else {
      searchedList = getPrvdr.prodectList
          .where((ProductModel product) =>
              product.title!.toLowerCase().contains(enterName.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}
