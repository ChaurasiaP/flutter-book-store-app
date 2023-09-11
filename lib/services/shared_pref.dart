import 'package:shared_preferences/shared_preferences.dart';

class LocalDataSaver {
  static String emailKey = "EMAILKEY";
  static String loginStatus = "loginStatus";
  static String deviceKey = "DEVICEKEY";
  static String firstNameKey = "FIRSTNAME";
  static String lastNameKey = "LASTNAME";

  static Future<bool?> saveDevice(String deviceKey) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(deviceKey, deviceKey);
  }

  static Future<bool?> saveLogData(bool isLoggedIn) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setBool(loginStatus, isLoggedIn);
  }

  static Future<bool?> saveEmail(String email) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(emailKey, email);
  }

  static Future<bool> saveFirstName(String fName) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(firstNameKey, fName);
  }
  static Future<bool> saveLastName(String lName) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(lastNameKey, lName);
  }

  static Future<String?> getDevice() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(deviceKey);
  }
  static Future<String?> getEmail() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(emailKey);
  }
  static Future<bool?> getLogData() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(loginStatus);
  }
  static Future<String?> getFirstName() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(firstNameKey);
  }
}