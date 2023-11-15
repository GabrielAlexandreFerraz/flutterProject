import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:novatela/services/medicamento_etico_post_http.dart';
import 'package:novatela/services/medicamento_similar_post_http.dart';

class AddMedicamentoSimilar extends StatelessWidget {
  final TextEditingController nomeComercial = TextEditingController();
  final TextEditingController laboratorio = TextEditingController();
  final TextEditingController principioAtivo = TextEditingController();
  final TextEditingController posologia = TextEditingController();
  final TextEditingController dosagem = TextEditingController();
  final TextEditingController tipo = TextEditingController();
  final TextEditingController controlado = TextEditingController();
  final TextEditingController interacaoMedicamentosa = TextEditingController();

  void _showAlertDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Mensagem'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void salvarMedicamento(BuildContext context) {
    var medicamento = {
      'nomeComercial': nomeComercial.text,
      'laboratorio': laboratorio.text,
      'principioAtivo': principioAtivo.text,
      'posologia': posologia.text,
      'dosagem': dosagem.text,
      'tipo': tipo.text,
      'controlado': controlado.text,
      'interacaoMedicamentosa': interacaoMedicamentosa.text,
    };

    MedicamentoSimilarPostHttp.salvarMedicamentoSimilar(medicamento);

    nomeComercial.clear();
    laboratorio.clear();
    principioAtivo.clear();
    posologia.clear();
    dosagem.clear();
    tipo.clear();
    controlado.clear();
    interacaoMedicamentosa.clear();

    _showAlertDialog(context, 'Medicamento Similar salvo com sucesso!');
  }

  void limparCampos() {
    nomeComercial.clear();
    laboratorio.clear();
    principioAtivo.clear();
    posologia.clear();
    dosagem.clear();
    tipo.clear();
    controlado.clear();
    interacaoMedicamentosa.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 186, 217, 238),
      appBar: AppBar(
        title: Text('Adicionar Medicamento Similar'),
        backgroundColor: Color.fromARGB(255, 130, 225, 238),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  controller: nomeComercial,
                  decoration: InputDecoration(labelText: 'Nome Comercial'),
                ),
                TextFormField(
                  controller: laboratorio,
                  decoration: InputDecoration(labelText: 'Laboratório'),
                ),
                TextFormField(
                  controller: principioAtivo,
                  decoration: InputDecoration(labelText: 'Princípio Ativo'),
                ),
                TextFormField(
                  controller: posologia,
                  decoration: InputDecoration(labelText: 'Posologia'),
                ),
                TextFormField(
                  controller: dosagem,
                  decoration: InputDecoration(labelText: 'Dosagem'),
                ),
                TextFormField(
                  controller: tipo,
                  decoration: InputDecoration(labelText: 'Tipo'),
                ),
                TextFormField(
                  controller: controlado,
                  decoration: InputDecoration(labelText: 'Controlado'),
                ),
                TextFormField(
                  controller: interacaoMedicamentosa,
                  decoration:
                      InputDecoration(labelText: 'Interação Medicamentosa'),
                ),
                SizedBox(height: 30.0),
                SizedBox(
                  width: 200.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          salvarMedicamento(context);
                        },
                        child: Text('Salvar'),
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 14, 29,
                              100), // Change the background color of the button here
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          limparCampos();
                        },
                        child: Text('Limpar'),
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 233, 82,
                              82), // Change the background color of the button here
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
