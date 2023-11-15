import 'package:flutter/material.dart';
import 'package:novatela/class/medicamento_class.dart';
import 'package:novatela/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserPageSearch extends StatefulWidget {
  @override
  _UserPageSearchState createState() => _UserPageSearchState();
}

class _UserPageSearchState extends State<UserPageSearch> {
  TextEditingController _searchController = TextEditingController();
  List<Medicamento> _searchResults = [];

  Future<void> _searchMedicamentos(String nome) async {
    try {
      final response =
          await http.get(Uri.parse('http://10.0.2.2:8080/medicamento-todos'));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);

        List<Medicamento> resultadosFiltrados = [];

        for (String categoria in ['eticos', 'similares', 'genericos']) {
          if (jsonData != null &&
              jsonData.containsKey(categoria) &&
              jsonData[categoria] is List<dynamic>) {
            List<dynamic> medicamentos = jsonData[categoria];

            List<Medicamento> resultadosCategoria = medicamentos
                .map((data) => Medicamento.fromJson(data))
                .where((medicamento) =>
                    (medicamento.nomeComercial
                            ?.toLowerCase()
                            .contains(nome.toLowerCase()) ??
                        false) ||
                    (medicamento.principioAtivo
                            ?.toLowerCase()
                            .contains(nome.toLowerCase()) ??
                        false))
                .toList();

            resultadosFiltrados.addAll(resultadosCategoria);
          }
        }

        setState(() {
          _searchResults = resultadosFiltrados;
        });
      } else {
        throw Exception(
            'Falha ao carregar medicamentos: ${response.statusCode}');
      }
    } catch (e) {
      print('Erro ao buscar medicamentos: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Erro ao buscar medicamentos'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Qual Medicamento Deseja Procurar ?',
          style:
              TextStyle(fontSize: 16.0), // Defina o tamanho do texto desejado
        ),
        backgroundColor: Color.fromARGB(255, 130, 225, 238),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: const InputDecoration(
                      hintText:
                          'Digite o Principio Ativo ou Nome do Medicamento?',
                      hintStyle: TextStyle(fontSize: 12.0),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () async {
                    String tipo = _searchController.text.toLowerCase();
                    await _searchMedicamentos(tipo);
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _searchResults.length,
                itemBuilder: (context, index) {
                  var medicamento = _searchResults[index];
                  return ListTile(
                    title: Text(
                        medicamento.nomeComercial ?? 'Não tem Nome Comercial'),
                    subtitle: Text(medicamento.laboratorio ??
                        'Laboratório não disponível'),
                    // Adicione outros campos do medicamento conforme necessário
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
