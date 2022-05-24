import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences{

static SharedPreferences? _prefs;

  static const _keyUsername = 'username';
  static const _keyPass = 'password';
  
  static Future init() async =>
      _prefs = await SharedPreferences.getInstance();

  static Future setUsername(String username) async =>
      await _prefs!.setString(_keyUsername, username);

  static String? getUsername() => _prefs!.getString(_keyUsername);

  static Future setPassword(String password) async =>
      await _prefs!.setString(_keyPass, password);

  static String? getPassword() => _prefs!.getString(_keyPass);


}