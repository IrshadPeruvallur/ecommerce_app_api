import 'package:shared_preferences/shared_preferences.dart';

class StoreService {
  setToken(tokenId) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('token', tokenId);
  }

  getToken() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('token');
  }

  clearToken() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }

  setUserId(userId) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('userId', userId);
  }

  getUserId() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('userId');
  }

  clearUserId() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }
}
