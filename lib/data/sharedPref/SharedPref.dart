import 'package:shared_preferences/shared_preferences.dart';

class UserSharedPreferences {
  static SharedPreferences? _prefs;

  Future<void> initSharedPreferences() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  Future<void> setProductInfo({required List<String> productInfo}) async {
    await initSharedPreferences();
    _prefs!.setStringList('productInfo', productInfo);
  }

  Future<List<dynamic>> getProductInfo() async {
    try {
      await initSharedPreferences();
      List<String>? data = _prefs?.getStringList("productInfo");
      if (data == null) {
        return [];
      }
      return data;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> resetSharedPreferencess() async {
    try {
      await initSharedPreferences();
      _prefs?.clear();
    } catch (e) {
      rethrow;
    }
  }
}
