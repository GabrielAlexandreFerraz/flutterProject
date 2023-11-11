import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:novatela/provider/user_provider.dart';

import '../services/medicamento_get_http.dart';

class SimpleUserPage extends StatefulWidget {
  @override
  _SimpleUserPageState createState() => _SimpleUserPageState();
}

class _SimpleUserPageState extends State<SimpleUserPage> {
  List<dynamic> medicamentos = [];

  @override
  void initState() {
    super.initState();
    _loadMedicamentos();
  }

  Future<void> _loadMedicamentos() async {
    final medicamentosList = await MedicamentoGetHttp.fetchMedicamentos();
    setState(() {
      medicamentos = medicamentosList;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final userName = userProvider.userName;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 186, 217, 238),
      appBar: AppBar(
        title: Text(
          'Bem vindo ao Bula Online $userName!',
          style: TextStyle(fontSize: 15),
        ),
        backgroundColor: Color.fromARGB(255, 130, 225, 238),
      ),
      body: ListView.builder(
        itemCount: medicamentos.length,
        itemBuilder: (context, index) {
          final medicamento = medicamentos[index];
          return ListTile(
            title: Text(medicamento['nome'] ?? ''),
            subtitle: Text(
              'Posologia: ${medicamento['posologia'] ?? ''}, '
              'Dosagem: ${medicamento['dosagem'] ?? ''}, '
              'Tipo: ${medicamento['tipo'] ?? ''}, '
              'Controlado: ${medicamento['controlado'] ?? ''}',
            ),
          );
        },
      ),
    );
  }
}
