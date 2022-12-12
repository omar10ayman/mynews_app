import 'package:shared_preferences/shared_preferences.dart';

class chacheHelper {
  static late SharedPreferences sharedPreferences;
  static cacheinitial() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setData(
      {required String key, required bool value}) async {
    return await sharedPreferences.setBool(key, value);
  }

  static bool? putData({
    required String key,
  }) {
    return sharedPreferences.getBool(key);
  }
}
