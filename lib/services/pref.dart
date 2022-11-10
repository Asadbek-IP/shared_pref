import 'dart:convert';

import 'package:shared_pref/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static void savePref(UserModel userModel) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String stringUser = jsonEncode(userModel);
    pref.setString("user", stringUser);
  }

  static Future<UserModel> getPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    String user = pref.getString("user")!;
    Map map = jsonDecode(user);
    return UserModel.fromJson(map);
  }

  static void saveLogin(bool isLogin) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool("login", isLogin);
  }

  static Future<bool?> getLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool("login");
  }
}
