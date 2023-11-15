import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DeletaMedicamentoSimilar extends StatelessWidget {
  Future<void> deletarMedicamentoSimilar(BuildContext context) async {
    var url = Uri.parse(
        'http://10.0.2.2:8080/medicamento-similar/${idMedicamentoSimilar.text}');
    var response = await http.delete(url);

    if (response.statusCode == 200) {
      _showAlertDialog(context, 'Medicamento Similar deletado com sucesso!');
    } else if (response.statusCode == 404) {
      _showAlertDialog(context, 'ID do Medicamento Não encontrado');
    } else {
      _showAlertDialog(
          context, 'Confirme o Número do ID do Medicamento Similar ');
    }
    idMedicamentoSimilar.clear();
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

  final TextEditingController idMedicamentoSimilar = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Excluir Medicamento Similar'),
        backgroundColor: Color.fromARGB(255, 130, 225, 238),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  controller: idMedicamentoSimilar,
                  decoration: InputDecoration(
                    labelText:
                        'Qual ID dos Medicamentos Similares você quer Deletar ?',
                    labelStyle: TextStyle(fontSize: 13.5),
                  ),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    deletarMedicamentoSimilar(context);
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
