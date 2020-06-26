import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  _loginFB(context) {
    //TODO: Entrar com o facebook e armazenar os dados obtidos.
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
          itemCount: 10000,
          itemBuilder: (ctx, index) {
            return Column(
              children: [
                ListTile(
                  title: Text('Nome da pessoa'),
                  leading: CircleAvatar(),
                  trailing: Text(
                    '02/05',
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
