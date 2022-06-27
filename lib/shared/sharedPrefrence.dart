import 'package:shared_preferences/shared_preferences.dart';


class cacheHelper
{

  static SharedPreferences? shared;
  static init() async
  {
    shared=await SharedPreferences.getInstance();
  }
  static Future<bool>putData(
      {
        required String key,
        required bool value,
      })async
  {
    return await shared!.setBool(key,value);
  }
  // static Future<bool?>saveData(
  //     {
  //       required String key,
  //       required String value,
  //     })async
  // {
  //   return await sharedPreferences!.setString(key,value);
  // }

  static  getData(
      {
        required String key,
      })async
  {
    return shared!.getString(key)??null;
  }
  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) {
      return await shared!.setString(key, value);
    }
    if (value is int) {
      return await shared!.setInt(key, value);
    }
    if (value is bool) {
      return await shared!.setBool(key, value);
    }

    return await shared!.setDouble(key, value);
  }

  static Future<bool> removeData({
    required String key,
  }) async
  {
    return await shared!.remove(key);
  }

}
