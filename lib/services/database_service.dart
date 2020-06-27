import 'dart:convert';

import 'package:get_storage/get_storage.dart';

import '../models/user.dart';

class DatabaseService {
  final _db = GetStorage();

  User findUser() {
    if (_db.read('user') == null) {
      return null;
    } else {
      var userMap = json.decode(_db.read('user'));
      return User.fromJson(userMap);
    }
  }

  saveUser(User u) {
    _db.write('user', json.encode(u.toJson()));
  }
}
