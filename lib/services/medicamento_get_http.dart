import 'package:http/http.dart' as http;
import 'dart:convert';

class MedicamentoGetHttp {
  static Future<List<dynamic>> fetchMedicamentos() async {
    final url = Uri.parse('http://10.0.2.2:8080/medicamentos');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      print('Resposta JSON: ${response.body}');
      if (response.body != null &&
          response.headers['content-type']?.contains('application/json') ==
              true) {
        final jsonResponse = json.decode(response.body);
        if (jsonResponse is List) {
          return jsonResponse;
        } else {
          print('Resposta inválida - não é uma lista.');
        }
      } else {
        print('Resposta inválida ou corpo de resposta vazio.');
      }
    } else {
      print(
          'Falha ao carregar medicamentos. Código de status: ${response.statusCode}');
    }

    return [];
  }
}
