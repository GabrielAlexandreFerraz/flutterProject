import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DeletaMedicamentoEtico extends StatelessWidget {
  Future<void> deletarMedicamento(BuildContext context) async {
    var url = Uri.parse(
        'http://10.0.2.2:8080/medicamento-etico/${idMedicamentoEtico.text}');
    var response = await http.delete(url);

    if (response.statusCode == 200) {
      _showAlertDialog(context, 'Medicamento Etico deletado com sucesso!');
    } else if (response.statusCode == 404) {
      _showAlertDialog(context, 'ID do Medicamento Não encontrado');
    } else {
      _showAlertDialog(
          context, 'Confirme o Número do ID do Medicamento Etico ');
    }
    idMedicamentoEtico.clear();
  }

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

  final TextEditingController idMedicamentoEtico = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 186, 217, 238),
      appBar: AppBar(
        title: Text('Excluir Medicamento Etico'),
        backgroundColor: Color.fromARGB(255, 130, 225, 238),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  controller: idMedicamentoEtico,
                  decoration: InputDecoration(
                    labelText:
                        'Qual ID dos Medicamentos Etico você quer Deletar ?',
                    labelStyle: TextStyle(fontSize: 14.0),
                  ),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    deletarMedicamento(context);
                  },
                  child: Text('Deletar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
