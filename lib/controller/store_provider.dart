import 'package:ecommerce_api/service/store.dart';
import 'package:flutter/material.dart';

class StoreProvider extends ChangeNotifier {
  StoreService store = StoreService();
  setToken(tokenId) async {
    await store.setToken(tokenId);
    notifyListeners();
  }

  getToken() async {
    return store.getToken();
  }

  clearToken() async {
    await store.clearToken();
    notifyListeners();
  }

  setUserId(userId) async {
    await store.setUserId(userId);
    notifyListeners();
  }

  getUserId() async {
    return store.getUserId();
  }

  clearUserId() async {
    await store.clearUserId();
    notifyListeners();
  }
}
