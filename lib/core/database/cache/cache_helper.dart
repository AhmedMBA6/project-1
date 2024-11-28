import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

//Write Data

/// initialize or obtain the sharedpreferences
  init() async{
    sharedPreferences = await SharedPreferences.getInstance();
  }

///this data to put data in local database using key
Future<bool> saveData({required String key, required dynamic value}) async{
if (value is bool ) {
  //Save an boolian value to the key
  return await sharedPreferences.setBool(key, value);
}
if (value is String) {
 // Save an string value to the key
  return await sharedPreferences.setString(key, value);
}
if (value is int) {
  //Save an integer value to the key
  return await sharedPreferences.setInt(key, value);
}else {
  //Save an double value to the key
  return await sharedPreferences.setDouble(key, value);
}
}

///this data to put data in local database using key
Future<dynamic> put({required String key, dynamic value}) async{
  if (value is String) {
    return await sharedPreferences.setString(key, value);
  }else if (value is bool) {
    return await sharedPreferences.setBool(key, value);
  }else {
    return await sharedPreferences.setInt(key, value);
  }
}

//Read Data

///this method to read data already saved in local database
dynamic getData({required String key}){
  return sharedPreferences.get(key);
}

///this method to Try reading data from the  key. If it doesn't exist, returns null.
String? getDataString({required String key}) {
  return sharedPreferences.getString(key);
}

///that methos check if local database contains key
Future<bool> containsKey({required String key})async{
  return sharedPreferences.containsKey(key);
}


//Remove Data

///remove data using spacific key
Future<bool> removeData({required String key})async{
  return await sharedPreferences.remove(key);
}

///clear all data in the local database
Future<bool> clearData()async{
  return await sharedPreferences.clear();
}

}