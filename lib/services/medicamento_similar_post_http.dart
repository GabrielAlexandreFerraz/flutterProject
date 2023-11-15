import 'package:http/http.dart' as http;
import 'dart:convert';

class MedicamentoSimilarPostHttp {
  static void salvarMedicamentoSimilar(Map<String, String> medicamento) async {
    var url = Uri.parse('http://10.0.2.2:8080/medicamento-similar');
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode(medicamento);
    var response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 201) {
      print('Medicamento salvo com sucesso!');
    } else {
      print(
          'Erro ao salvar o medicamento. Código de status: ${response.statusCode}');
    }
  }
}
