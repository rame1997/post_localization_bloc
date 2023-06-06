import 'package:shared_preferences/shared_preferences.dart';


class SharedPrefController  {
  // User user = User();
  static SharedPrefController instance = SharedPrefController._();
  late SharedPreferences _sharedPreferences;

  SharedPrefController._();

  factory SharedPrefController() {
    return instance;
  }

  Future<void> initSharePre() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }
  Future<void> cacheLanguageCode(String languageCode) async {
    _sharedPreferences.setString("LOCALE", languageCode);
  }

  Future<String> getCachedLanguageCode() async {
    final cachedLanguageCode = _sharedPreferences.getString("LOCALE");
    if (cachedLanguageCode != null) {
      return cachedLanguageCode;
    } else {
      return "en";
    }
  }
}
