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

  static String? getToken() {
    return _sharedPreferences!.getString(tokenKey);
  }
}
