import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:novatela/provider/user_provider.dart';

class SimpleUserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final userName = userProvider.userName;

    return Scaffold(
      backgroundColor: Color.fromARGB(245, 222, 179, 120),
      appBar: AppBar(
          title: Text(
            'Bem vindo ao Bula Online $userName!',
            style: TextStyle(fontSize: 15),
          ),
          backgroundColor: Colors.amber),
    );
  }
}
