import 'package:flutter/material.dart';
import 'package:novatela/views/adm_add_medicamento_etico.dart';
import 'package:novatela/views/adm_delete_medicamento_etico.dart';
import 'package:novatela/views/adm_list_all_medicamento_etico.dart';
import 'package:provider/provider.dart';
import 'package:novatela/provider/user_provider.dart';

class AdminUserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 186, 217, 238),
      appBar: AppBar(
        title: Consumer<UserProvider>(
          builder: (context, userProvider, _) {
            final userName = userProvider.userName;
            return Text(
              'Página de Adm, Bem-vindo $userName!',
              style: TextStyle(fontSize: 15),
            );
          },
        ),
        backgroundColor: Color.fromARGB(255, 130, 225, 238),
      ),
      drawer: Builder(
        builder: (BuildContext context) {
          return Drawer(
            width: MediaQuery.of(context).size.width * 0.7,
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Consumer<UserProvider>(
                    builder: (context, userProvider, _) {
                      final userName = userProvider.userName;
                      return Text(
                        'Administrador $userName',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      );
                    },
                  ),
                ),
                ListTile(
                  title: const Center(
                    child: Text(
                      'Adicionar Medicamento Etico',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddMedicamentoEtico()),
                    );
                  },
                  tileColor: Colors.white, // Cor de fundo do ListTile
                  contentPadding: EdgeInsets.all(4.0), // Espaçamento interno
                  dense: true, // Reduz a altura do ListTile
                  shape: Border(bottom: BorderSide(color: Colors.grey)),
                ),
                ListTile(
                  title: const Center(
                    child: Text(
                      'Excluir Medicamento Etico',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DeletaMedicamentoEtico()),
                    );
                  },
                  tileColor: Colors.white, // Cor de fundo do ListTile
                  contentPadding: EdgeInsets.all(4.0), // Espaçamento interno
                  dense: true, // Reduz a altura do ListTile
                  shape: Border(bottom: BorderSide(color: Colors.grey)),
                ),
                ListTile(
                  title: const Center(
                    child: Text(
                      'Adicionar Medicamento Generico',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  onTap: () {
                    // Ação ao selecionar a Opção 1 no Drawer
                  },
                  tileColor: Colors.white, // Cor de fundo do ListTile
                  contentPadding: EdgeInsets.all(4.0), // Espaçamento interno
                  dense: true, // Reduz a altura do ListTile
                  shape: Border(bottom: BorderSide(color: Colors.grey)),
                ),
                ListTile(
                  title: const Center(
                    child: Text(
                      'Excluir Medicamento Generico',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  onTap: () {
                    // Ação ao selecionar a Opção 1 no Drawer
                  },
                  tileColor: Colors.white, // Cor de fundo do ListTile
                  contentPadding: EdgeInsets.all(4.0), // Espaçamento interno
                  dense: true, // Reduz a altura do ListTile
                  shape: Border(bottom: BorderSide(color: Colors.grey)),
                ),
                ListTile(
                  title: const Center(
                    child: Text(
                      'Adicionar Medicamento Similar',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  onTap: () {
                    // Ação ao selecionar a Opção 1 no Drawer
                  },
                  tileColor: Colors.white, // Cor de fundo do ListTile
                  contentPadding: EdgeInsets.all(4.0), // Espaçamento interno
                  dense: true, // Reduz a altura do ListTile
                  shape: Border(bottom: BorderSide(color: Colors.grey)),
                ),
                ListTile(
                  title: const Center(
                    child: Text(
                      'Excluir Medicamento Similar',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  onTap: () {
                    // Ação ao selecionar a Opção 1 no Drawer
                  },
                  tileColor: Colors.white, // Cor de fundo do ListTile
                  contentPadding: EdgeInsets.all(4.0), // Espaçamento interno
                  dense: true, // Reduz a altura do ListTile
                  shape: Border(bottom: BorderSide(color: Colors.grey)),
                ),
                ListTile(
                  title: const Center(
                    child: Text(
                      'Listar Todos Medicamento',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ListarTodosMedicamentos()),
                    );
                  },
                  tileColor: Colors.white, // Cor de fundo do ListTile
                  contentPadding: EdgeInsets.all(4.0), // Espaçamento interno
                  dense: true, // Reduz a altura do ListTile
                  shape: Border(bottom: BorderSide(color: Colors.grey)),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
