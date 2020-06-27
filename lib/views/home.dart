import 'package:birthdayremember/services/database_service.dart';
import 'package:birthdayremember/services/facebook_service.dart';
import 'package:flutter/material.dart';

import '../models/user.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  User user = DatabaseService().findUser();

  _loginFB(context) async {
    await FacebookService().getFriendList();
    setState(() {
      user = DatabaseService().findUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(59, 89, 152, 1),
        onPressed: () => _loginFB(context),
        child: Image.asset(
          'assets/icons/facebook-icon.png',
          width: 25,
        ),
      ),
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: Image.asset(
            'assets/icons/icon.png',
          ),
        ),
        centerTitle: false,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          'Aniversariantes',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: ListView.builder(
          itemCount: user.friends.length,
          itemBuilder: (ctx, index) {
            var friend = user.friends[index];
            return Column(
              children: [
                ListTile(
                  title: Text('${friend.name}'),
                  leading: CircleAvatar(),
                  trailing: Text(
                    '${friend.id}',
                    style: TextStyle(
                      color: Colors.pink,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Divider(),
              ],
            );
          },
        ),
      ),
    );
  }
}
