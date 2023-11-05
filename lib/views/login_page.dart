import 'package:flutter/material.dart';
import 'package:novatela/provider/user_provider.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:novatela/views/adm_user_page.dart';
import 'package:novatela/views/simple_user_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _senha = '';

  Future<void> fetchData(String email, String senha) async {
    final baseUrl = 'http://10.0.2.2:8080/usuarios';
    final endpoint = '/buscarUsuario';

    Uri uri = Uri.parse('$baseUrl$endpoint?email=$email&senha=$senha');

    try {
      print('entrou no try');
      final response = await http.get(uri).timeout(Duration(seconds: 30));

      if (response.statusCode == 200) {
        print('Resposta Completa: ${response.body}');

        Map<String, dynamic> usuario = jsonDecode(response.body);
        if (usuario['tipo'] == '1') {
          Provider.of<UserProvider>(context, listen: false)
              .setUserName(usuario['nome']);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AdminUserPage()),
          );
        } else if (usuario['tipo'] == '2') {
          Provider.of<UserProvider>(context, listen: false)
              .setUserName(usuario['nome']);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SimpleUserPage()),
          );
        }
      } else {
        print('Erro: ${response.statusCode}');
      }
    } catch (e) {
      print('Erro: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira seu email';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _email = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Senha'),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira sua senha';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _senha = value!;
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      fetchData(_email, _senha);
                    }
                  },
                  child: Text('Fazer Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
