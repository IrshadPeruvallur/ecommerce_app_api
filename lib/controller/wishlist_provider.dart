import 'dart:developer';

import 'package:ecommerce_api/model/wishlist_model.dart';
import 'package:ecommerce_api/service/wishlist_service.dart';
import 'package:flutter/material.dart';

class WishListProvider extends ChangeNotifier {
  WishListService _wishListService = WishListService();
  List wishListItemId = [];
  Future<void> addToWishList(
      String productId, String userId, String token) async {
    final product = WishListModel(id: productId);
    await _wishListService.addToWishList(product, userId, token);
    notifyListeners();
  }

  Future<void> getWishListProduct(String userId, String token) async {
    final product = WishListModel();
    wishListItemId =
        await _wishListService.getWishListProduct(product, userId, token);
    notifyListeners();
  }
}
