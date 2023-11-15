import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DeletaMedicamentoGenerico extends StatelessWidget {
  Future<void> deletarMedicamentoGenerico(BuildContext context) async {
    var url = Uri.parse(
        'http://10.0.2.2:8080/medicamento-generico/${idMedicamentoGenerico.text}');
    var response = await http.delete(url);

    if (response.statusCode == 200) {
      _showAlertDialog(context, 'Medicamento Generico deletado com sucesso!');
    } else if (response.statusCode == 404) {
      _showAlertDialog(context, 'ID do Medicamento Não encontrado');
    } else {
      _showAlertDialog(
          context, 'Confirme o Número do ID do Medicamento Generico ');
    }
    idMedicamentoGenerico.clear();
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

  final TextEditingController idMedicamentoGenerico = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 186, 217, 238),
      appBar: AppBar(
        title: Text('Excluir Medicamento Generico'),
        backgroundColor: Color.fromARGB(255, 130, 225, 238),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  controller: idMedicamentoGenerico,
                  decoration: InputDecoration(
                    labelText:
                        'Qual ID dos Medicamentos Generico você quer Deletar ?',
                    labelStyle: TextStyle(fontSize: 13.5),
                  ),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    deletarMedicamentoGenerico(context);
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
