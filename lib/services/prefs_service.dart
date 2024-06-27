import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/member_model.dart';

class PrefsService {
  static storeName(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('name', name);
  }

  static Future<String?> loadName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('name');
  }

  static Future<bool?> removeName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove('name');
  }

  static setUser(MemberModel model) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String stringUser = jsonEncode(model);
    prefs.setString('user', stringUser);
  }

  static Future<MemberModel?> loadUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? stringUser = prefs.getString('user');
    if (stringUser == null || stringUser.isEmpty) return null;

    Map<String, dynamic> map = jsonDecode(stringUser);
    return MemberModel.fromJson(map);
  }
}
