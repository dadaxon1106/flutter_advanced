import 'package:flutter_advance/model/user_model.dart';
import 'package:hive/hive.dart';

class HiveService {
  static final box = Hive.box('local');
  static storeString(String name) {
    box.put('name', name);
  }

  static String loadUser() {
    return box.get('name');
  }

  static putUser(UserModel user) {
    box.put('user', user.toJson());
  }

  static UserModel getUser() {
    var map = UserModel.fromJson(box.get('user'));
    return map;
  }

  static void deleteUser() {
    box.delete('user');
  }
}
