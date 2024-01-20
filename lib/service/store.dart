import 'package:shared_preferences/shared_preferences.dart';

class StoreService {
  setKeys(key, value) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(key, value);
  }

  getValues(key) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(key);
  }

  clearValues() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }

  // setUserId(userId) async {
  //   final sharedPreferences = await SharedPreferences.getInstance();
  //   await sharedPreferences.setString('userId', userId);
  // }

  // getUserId() async {
  //   final sharedPreferences = await SharedPreferences.getInstance();
  //   return sharedPreferences.getString('userId');
  // }

  // clearUserId() async {
  //   final sharedPreferences = await SharedPreferences.getInstance();
  //   await sharedPreferences.clear();
  // }
}
