import 'package:ecommerce_api/service/store.dart';
import 'package:flutter/material.dart';

class StoreProvider extends ChangeNotifier {
  StoreService store = StoreService();
  setToken(key, tokenId) async {
    await store.setKeys(key, tokenId);
    notifyListeners();
  }

  getToken(key) async {
    return store.getValues(key);
  }

  clearToken() async {
    await store.clearValues();
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
