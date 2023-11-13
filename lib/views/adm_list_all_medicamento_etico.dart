import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ListarTodosMedicamentos extends StatelessWidget {
  Future<List<dynamic>> _getMedicamentos() async {
    var response =
        await http.get(Uri.parse('http://10.0.2.2:8080/medicamento-todos'));
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      if (jsonData.containsKey("eticos") &&
          jsonData.containsKey("genericos") &&
          jsonData.containsKey("similares")) {
        var eticos = jsonData["eticos"];
        var genericos = jsonData["genericos"];
        var similares = jsonData["similares"];

        // Combine todos os tipos de medicamentos em uma lista
        var todosMedicamentos = [...eticos, ...genericos, ...similares];

        return todosMedicamentos;
      } else {
        throw Exception('O JSON não contém os arrays necessários');
      }
    } else {
      throw Exception('Falha ao carregar os medicamentos');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Medicamentos'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _getMedicamentos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
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
                    return ListTile(
                      title: Text(medicamento['nomeComercial'] ??
                          'Nome não disponível'),
                      subtitle: Text(medicamento['laboratorio'] ??
                          'Laboratório não disponível'),
                      // Adicione mais informações ou formate conforme necessário
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
