import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:novatela/provider/user_provider.dart';

class SimpleUserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final userName = userProvider.userName;

    return Scaffold(
      appBar: AppBar(
        title: Text('Página do Usuario'),
      ),
      body: Center(
        child: Text('Bem-vindo, $userName!'),
      ),
    );
  }
}
