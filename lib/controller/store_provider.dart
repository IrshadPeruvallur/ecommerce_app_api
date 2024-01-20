import 'package:ecommerce_api/service/store.dart';
import 'package:flutter/material.dart';

class StoreProvider extends ChangeNotifier {
  StoreService store = StoreService();
  setKeys(key, tokenId) async {
    await store.setKeys(key, tokenId);
    notifyListeners();
  }

  getValues(key) async {
    return store.getValues(key);
  }

  clearValues() async {
    await store.clearValues();
    notifyListeners();
  }

  // setUserId(userId) async {
  //   await store.setUserId(userId);
  //   notifyListeners();
  // }

  // getUserId() async {
  //   return store.getUserId();
  // }

  // clearUserId() async {
  //   await store.clearUserId();
  //   notifyListeners();
  // }
}
