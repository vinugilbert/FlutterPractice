import 'package:shared_preferences/shared_preferences.dart';

class UserPreference{
  static const _keyUserName='username';
  static const _keyEmailAddress='emailid';
  static const _keyPassword='password';

  static  late SharedPreferences _preferences;

  static Future init() async=>
      _preferences=await SharedPreferences.getInstance();

  static Future setUserName(String username) async =>
  await _preferences.setString(_keyUserName, username);

  static String?  getUserName() =>
  _preferences.getString(_keyUserName);

  static Future setUserEmail(String email) async =>
      await _preferences.setString(_keyEmailAddress, email);

  static String?  getUserEmail() =>
      _preferences.getString(_keyEmailAddress);

  static Future setUserPassword (int password) async =>
      await _preferences.setInt(_keyPassword, password);

  static String?  getUserPassword() =>
      _preferences.getString(_keyPassword);
  }