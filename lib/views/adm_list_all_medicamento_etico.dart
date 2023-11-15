import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:novatela/services/medicamento_todos_get_http.dart';

class ListarTodosMedicamentos extends StatelessWidget {
  final MedicamentosTodosAdmGetHttp medicamentosTodosAdmGetHttp =
      MedicamentosTodosAdmGetHttp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Todos Medicamentos'),
        backgroundColor: Color.fromARGB(255, 130, 225, 238),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: medicamentosTodosAdmGetHttp.getMedicamentosAdm(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Erro ao carregar os medicamentos'),
            );
          } else {
            if (snapshot.data != null && snapshot.data!.isNotEmpty) {
              return SingleChildScrollView(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    var medicamento = snapshot.data![index];
                    var id = medicamento['id'];
                    return ListTile(
                      title: Text(medicamento['nomeComercial'] ??
                          'Nome não disponível'),
                      subtitle: Text(medicamento['laboratorio'] ??
                          'Laboratório não disponível'),
                      trailing: Text('ID: $id'),
                    );
                  },
                ),
              );
            } else {
              return Center(
                child: Text('Nenhum medicamento encontrado'),
              );
            }
          }
        },
      ),
    );
  }
}
