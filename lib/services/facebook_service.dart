import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class FacebookService {
  Future<String> _login() async {
    final facebookLogin = FacebookLogin();
    final result = await facebookLogin.logIn([
      'email',
      'public_profile',
      'user_birthday',
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
  }
}
