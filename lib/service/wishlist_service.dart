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
        data: product.toJson(token)['data'],
        options: Options(
          headers: product.toJson(token)['headers'],
        ),
      );

      if (response.statusCode == 200) {
        log('Product added to WishList');
      } else {
        log('Unsuccessful. Status code: ${response.statusCode}');
        log('Response data: ${response.data}');
      }
    } catch (e) {
      log('Error: $e');
      throw e;
    }
  }

  getWishListProduct(WishListModel product, String userId, String token) async {
    final url = 'http://localhost:9000/api/users/$userId/wishlists';

    try {
      Response response = await dio.get(
        url,
        options: Options(
          headers: product.toJson(token)['headers'],
        ),
      );

      if (response.statusCode == 200) {
        final List<dynamic> productId =
            response.data['data']['getWishList']['product'] as List;

        return productId;
      } else {
        log('Unsuccessful. Status code: ${response.statusCode}');
        log('Response data: ${response.data}');
        throw Exception('Failed to fetch wishlist');
      }
    } catch (e) {
      // log('Error: $e');
      rethrow;
    }
  }
}
