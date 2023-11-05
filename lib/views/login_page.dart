import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
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
      body: Container(
        padding: EdgeInsets.only(top: 10, left: 40, right: 40),
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: SizedBox(
                  child: Text('Bula Online',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(245, 222, 179, 120))),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white12,
                  border: Border.all(
                    color: const Color.fromARGB(245, 222, 179, 120),
                    width: 1,
                  ),
                ),
                padding: const EdgeInsets.all(20),
                child: Image.asset(
                  'assets/iconebulapequeno.png',
                  width: 80,
                  height: 80,
                ),
              ),
              SizedBox(height: 30),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'Email',
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Color.fromARGB(245, 222, 179, 120),
                          )),
                          labelStyle: TextStyle(
                            color: Color.fromARGB(245, 222, 179, 120),
                          )),
                      cursorColor: Color.fromARGB(245, 222, 179, 120),
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
                      decoration: const InputDecoration(
                        labelText: 'Senha',
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(245, 222, 179,
                                120), // Define a cor de destaque ao ser selecionado
                          ),
                        ),
                        labelStyle: TextStyle(
                          color: Color.fromARGB(245, 222, 179,
                              120), // Cor do rótulo quando não está selecionado
                        ),
                      ),
                      cursorColor: const Color.fromARGB(
                          245, 222, 179, 120), // Define a cor do cursor
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
                    SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 35),
                        child: SizedBox(
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                fetchData(_email, _senha);
                              }
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color.fromRGBO(226, 204, 171, 01))),
                            child: Text('Fazer Login'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            launch('https://www.facebook.com');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white12,
                                border: Border.all(
                                  color:
                                      const Color.fromARGB(245, 245, 240, 234),
                                  width: 2,
                                )),
                            child: Padding(
                              padding: const EdgeInsets.all(7.5),
                              child: Image.asset(
                                'assets/facebookpequeno.png',
                                width: 50,
                                height: 50,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            launch('https://www.google.com');
                          },
                          child: Row(
                            children: [
                              SizedBox(width: 10),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white12,
                                  border: Border.all(
                                    color: const Color.fromARGB(
                                        245, 245, 240, 234),
                                    width: 2,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(7),
                                  child: Image.asset(
                                    'assets/googleicon.png',
                                    width: 50,
                                    height: 50,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            launch('https://www.instagram.com');
                          },
                          child: Row(
                            children: [
                              SizedBox(width: 8),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white12,
                                  border: Border.all(
                                    color: Color.fromARGB(245, 245, 240, 234),
                                    width: 2,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(6),
                                  child: Image.asset(
                                    'assets/instagrempequeno.png',
                                    width: 50,
                                    height: 50,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
