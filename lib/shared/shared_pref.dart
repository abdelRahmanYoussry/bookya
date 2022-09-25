import 'package:bookya/shared/Strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static SharedPreferences? _sharedPreferences;

  static initialize() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static saveToken(String token) async {
    await _sharedPreferences!.setString(tokenKey, token);
  }

  static saveEmail(String email) async {
    await _sharedPreferences!.setString(emailKey, email);
  }

  static String? getEmail() {
    return _sharedPreferences!.getString(emailKey);
  }
  static saveImage(String image) async {
    await _sharedPreferences!.setString(imageKey, image);
  }

  static String? getImage() {
    return _sharedPreferences!.getString(imageKey);
  }
  static saveName(String name) async {
    await _sharedPreferences!.setString(nameKey, name);
  }

  static String? getName() {
    return _sharedPreferences!.getString(nameKey);
  }

  static String? getToken() {
    return _sharedPreferences!.getString(tokenKey);
  }
}
