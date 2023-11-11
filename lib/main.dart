import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:novatela/provider/user_provider.dart';
import 'package:novatela/views/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(
          create: (context) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Tela Login',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        home: LoginPage(),
      ),
    );
  }
}
