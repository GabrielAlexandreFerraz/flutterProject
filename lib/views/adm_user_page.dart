import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:novatela/provider/user_provider.dart';

class AdminUserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final userName = userProvider.userName;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 186, 217, 238),
      appBar: AppBar(
          title: Text(
            'Página de Adm, Bem vindo $userName!',
            style: TextStyle(fontSize: 15),
          ),
          backgroundColor: Color.fromARGB(255, 130, 225, 238)),
    );
  }
}
