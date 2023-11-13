import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DeletaMedicamentoEtico extends StatelessWidget {
  Future<void> deletarMedicamento() async {
    var url = Uri.parse(
        'http://10.0.2.2:8080/medicamento-etico/${idMedicamentoEtico.text}');
    var response = await http.delete(url);

    if (response.statusCode == 200) {
      print('Medicamento deletado com sucesso!');
    } else {
      print(
          'Erro ao deletar o medicamento. Código de status: ${response.statusCode}');
    }
    idMedicamentoEtico.clear();
  }

  final TextEditingController idMedicamentoEtico = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Excluir Medicamento Etico'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  controller: idMedicamentoEtico,
                  decoration: const InputDecoration(
                      labelText: 'Qual ID do medicamento você quer Deletar ?'),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    deletarMedicamento();
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
