import 'package:flutter_advance/model/member_model.dart';
import 'package:hive/hive.dart';

class HiveService {
  static final box = Hive.box('local');
  static storeString(String name) {
    box.put('name', name);
  }

  static String loadUser() {
    return box.get('name');
  }

  static putUser(MemberModel user) {
    box.put('user', user.toJson());
  }

  static MemberModel getUser() {
    var map = MemberModel.fromJson(box.get('user'));
    return map;
  }

  static void deleteUser() {
    box.delete('user');
  }
}
