import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:novatela/provider/user_provider.dart';
import 'package:novatela/views/adm_user_page.dart';
import 'package:novatela/views/simple_user_page.dart';
import 'package:provider/provider.dart';

class LoginGetHttp {
  static Future<void> fetchData(
      BuildContext context, String email, String senha) async {
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
}
