import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:ecommerce_api/model/product_model.dart';
import 'package:ecommerce_api/model/wishlist_model.dart';

class WishListService {
  Dio dio = Dio();
  addToWishList(WishListModel product, String userId, String token) async {
    final url = 'http://localhost:9000/api/users/$userId/wishlists';

    try {
      Response response = await dio.post(
        url,
        data: product.toWishList(token)['data'],
        options: Options(
          headers: product.toWishList(token)['headers'],
        ),
      );

      if (response.statusCode == 200) {
        log('Successful');
      } else {
        log('Unsuccessful. Status code: ${response.statusCode}');
        log('Response data: ${response.data}');
      }
    } catch (e) {
      log('Error: $e');
      throw e;
    }
  }
}
