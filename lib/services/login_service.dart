import 'package:dio/dio.dart';

void fetchData(String email, String senha) async {
  final dio = Dio();
  final baseUrl = 'http://localhost:8080/usuarios';
  final endpoint = '/buscarUsuario';

  try {
    final response = await dio.get(
      '$baseUrl$endpoint',
      queryParameters: {
        'email': email,
        'senha': senha,
      },
    );

    if (response.statusCode == 200) {
      print(response.data);
    } else {
      print('Erro: ${response.statusCode}');
    }
  } catch (e) {
    print('Erro: $e');
  }
}
