import 'package:birthdayremember/services/database_service.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/friend.dart';
import '../models/user.dart';

class FacebookService {
  Future<String> _login() async {
    final facebookLogin = FacebookLogin();
    final result = await facebookLogin.logIn([
      'user_friends',
    ]);
    return result.accessToken.token;
  }

  Future<dynamic> getFriendList() async {
    String token = await _login();
    final graphResponse = await http.get(
        'https://graph.facebook.com/v7.0/me/friends?access_token=' + token);
    final data = json.decode(graphResponse.body);
    print('RESULTADO DA API:' + data.toString());
    List<Friend> friends = [];
    for (var d in data['data']) {
      friends.add(
        Friend(
          id: d['id'],
          name: d['name'],
        ),
      );
    }
    DatabaseService().saveUser(User(friends));
  }
}
