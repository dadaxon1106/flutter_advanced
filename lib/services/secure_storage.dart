import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static final _secureSt = const FlutterSecureStorage();
  static setName(String name) {
    _secureSt.write(key: 'name', value: name);
  }

  static Future<String?> getUserName() async {
    final result = await _secureSt.read(key: 'name');
    return result;
  }

  static const _keyUserName = 'username';
  static Future setUserName(String name) async {
    await _secureSt.write(key: _keyUserName, value: name);
  }

  static Future<String?> getName() async =>
      await _secureSt.read(key: _keyUserName);
}
