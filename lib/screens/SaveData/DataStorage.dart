
import 'package:shared_preferences/shared_preferences.dart';
// class StorageUtil {
//   static StorageUtil _storageUtil;
//   static SharedPreferences _preferences;
//
//   static Future<StorageUtil> getInstance() async {
//     if (_storageUtil == null) {
//       // keep local instance till it is fully initialized.
//       var secureStorage = StorageUtil._();
//       await secureStorage._init();
//       _storageUtil = secureStorage;
//     }
//     return _storageUtil;
//   }
//   StorageUtil._();
//   Future _init() async {
//     _preferences = await SharedPreferences.getInstance();
//   }
//   // get string
//   static String getString(String key, {String defValue = ''}) {
//     if (_preferences == null) return defValue;
//     return _preferences.getString(key) ?? defValue;
//   }
//   // put string
//   static Future<bool> putString(String key, String value) {
//     if (_preferences == null) return null;
//     return _preferences.setString(key, value);
//   }
//
// }

//how to save data to login
//تقريبا الطريقه ديه بستخدمها لما يبقا فيه AIP معايا

// 1-أضف تبعية
// dependencies:
// get_storage:
//
//
// 2-تهيئة برنامج تشغيل التخزين في انتظار
// main() async {
// await GetStorage.init();
// runApp(App());
// }
//
//
// 3-لحفظ المعلومات
// import 'package:get_storage/get_storage.dart';
//
// void getUserInfo(String token) {
// EasyLoading.show();
// ApiManager.instance
//     .getAPICall(BASE_URL_LIVE + get_user_info, token)
//     .then((value) async {
// try {
// var response = ApiManager.instance.responseToJson(value);
// if (value.statusCode == 200 || value.statusCode == 201) {
//
// SharedPref.pref.setBool("isLogin", true);
// storage.write("userInfo", response);  // Save here
// Get.to(() => HomeScreen());
//
// } else {
// var errorMsg  = response["message"] ?? "";
// CustomToast.showErrorToast(errorMsg);
// }
// } on Exception catch (exception) {
// print(exception.toString());
// CustomToast.showErrorToast(exception.toString());
// } catch (error) {
// print(error.toString());
// CustomToast.showErrorToast(error.toString());
// }
// }, onError: (error) {
// EasyLoading.dismiss();
// CustomToast.showErrorToast(error.toString());
// });
// }
//
//
// 4-واحصل على بياناتك المرتجعة
// static UserInfoModel getUserInfo()  {
// final storage = GetStorage();
//
// UserInfoModel user;
// try {
// final json = storage.read("userInfo");
// if (json != null) {
// return user = UserInfoModel.fromJson(json);
// }
// } catch (err) {
// print(err);
// }
// }




