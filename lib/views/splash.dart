import 'dart:convert';

import 'package:birthdayremember/models/user.dart';
import 'package:birthdayremember/services/database_service.dart';
import 'package:birthdayremember/views/home.dart';
import 'package:birthdayremember/views/login.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1, milliseconds: 500)).then(
      (value) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) =>
              DatabaseService().findUser() == null ? Login() : Home(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/icons/icon.png',
          width: MediaQuery.of(context).size.width * 0.35,
        ),
      ),
    );
  }
}
