import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:novatela/services/medicamento_etico_post_http.dart';

class AddMedicamentoEtico extends StatelessWidget {
  final TextEditingController nomeComercialController = TextEditingController();
  final TextEditingController laboratorioController = TextEditingController();
  final TextEditingController principioAtivoController =
      TextEditingController();
  final TextEditingController posologiaController = TextEditingController();
  final TextEditingController dosagemController = TextEditingController();
  final TextEditingController tipoController = TextEditingController();
  final TextEditingController controladoController = TextEditingController();
  final TextEditingController interacaoMedicamentosaController =
      TextEditingController();

  void salvarMedicamento() {
    var medicamento = {
      'nomeComercial': nomeComercialController.text,
      'laboratorio': laboratorioController.text,
      'principioAtivo': principioAtivoController.text,
      'posologia': posologiaController.text,
      'dosagem': dosagemController.text,
      'tipo': tipoController.text,
      'controlado': controladoController.text,
      'interacaoMedicamentosa': interacaoMedicamentosaController.text,
    };

    MedicamentoEticoPostHttp.salvarMedicamentoEtico(medicamento);

    nomeComercialController.clear();
    laboratorioController.clear();
    principioAtivoController.clear();
    posologiaController.clear();
    dosagemController.clear();
    tipoController.clear();
    controladoController.clear();
    interacaoMedicamentosaController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Medicamento Etico'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  controller: nomeComercialController,
                  decoration: InputDecoration(labelText: 'Nome Comercial'),
                ),
                TextFormField(
                  controller: laboratorioController,
                  decoration: InputDecoration(labelText: 'Laboratório'),
                ),
                TextFormField(
                  controller: principioAtivoController,
                  decoration: InputDecoration(labelText: 'Princípio Ativo'),
                ),
                TextFormField(
                  controller: posologiaController,
                  decoration: InputDecoration(labelText: 'Posologia'),
                ),
                TextFormField(
                  controller: dosagemController,
                  decoration: InputDecoration(labelText: 'Dosagem'),
                ),
                TextFormField(
                  controller: tipoController,
                  decoration: InputDecoration(labelText: 'Tipo'),
                ),
                TextFormField(
                  controller: controladoController,
                  decoration: InputDecoration(labelText: 'Controlado'),
                ),
                TextFormField(
                  controller: interacaoMedicamentosaController,
                  decoration:
                      InputDecoration(labelText: 'Interação Medicamentosa'),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    salvarMedicamento();
                  },
                  child: Text('Salvar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
