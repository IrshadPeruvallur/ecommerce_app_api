import 'package:ecommerce_api/service/wishlist_service.dart';
import 'package:flutter/material.dart';

class WishListProvider extends ChangeNotifier {
  WishListService _wishListService = WishListService();

  Future<void> addToWishList(product, String userId, String token) async {
    await _wishListService.addToWishList(product, userId, token);
    notifyListeners();
  }
}
