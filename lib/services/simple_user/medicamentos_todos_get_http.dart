import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MedicamentosTodosGetHttp {
  Future<List<dynamic>> getMedicamentos() async {
    var response =
        await http.get(Uri.parse('http://10.0.2.2:8080/medicamento-todos'));
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      if (jsonData.containsKey("eticos") &&
          jsonData.containsKey("genericos") &&
          jsonData.containsKey("similares")) {
        var eticos = jsonData["eticos"];
        var genericos = jsonData["genericos"];
        var similares = jsonData["similares"];

        var todosMedicamentos = [...eticos, ...genericos, ...similares];

        return todosMedicamentos;
      } else {
        throw Exception('O JSON não contém os arrays necessários');
      }
    } else {
      throw Exception('Falha ao carregar os medicamentos');
    }
  }
}
