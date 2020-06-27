import 'package:birthdayremember/services/facebook_service.dart';
import 'package:birthdayremember/views/home.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  _loginFB(context) async {
    FacebookService().getFriendList().then(
          (value) => Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (_) => Home(),
            ),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (ctx, cnt) {
        return Container(
          height: cnt.maxHeight,
          width: cnt.maxWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icons/icon.png',
                width: cnt.maxWidth * 0.35,
              ),
              SizedBox(height: cnt.maxHeight * 0.02),
              Text(
                'Birthday Remember',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: cnt.maxWidth * 0.075,
                ),
                child: Text(
                  'Entre com sua conta do facebook para obter a lista de aniversariantes.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(height: cnt.maxHeight * 0.02),
              FlatButton(
                color: Color.fromRGBO(59, 89, 152, 1),
                onPressed: () => _loginFB(context),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/icons/facebook-icon.png',
                      width: 25,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Entrar com o Facebook',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
