import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

class Cashe_helper
{

  static SharedPreferences? sharedPreferences;

  static init() async
  {
    sharedPreferences = await SharedPreferences.getInstance();
  }

 static  Future<bool?> putBool({ required String key, required bool value}) async
  {
   return await sharedPreferences?.setBool(key, value);
  }

 static bool? getbool (String key)
  {
   return sharedPreferences?.getBool(key);
  }
}