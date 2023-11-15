import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:novatela/services/simple_user/medicamentos_todos_get_http.dart';
import 'package:provider/provider.dart';
import 'package:novatela/provider/user_provider.dart';

class UserPageList extends StatelessWidget {
  final MedicamentosTodosGetHttp medicamentosTodosGetHttp =
      MedicamentosTodosGetHttp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Todos Medicamentos'),
        backgroundColor: Color.fromARGB(255, 130, 225, 238),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: medicamentosTodosGetHttp.getMedicamentos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Erro ao carregar os medicamentos'),
            );
          } else {
            if (snapshot.data != null && snapshot.data!.isNotEmpty) {
              return SingleChildScrollView(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    var medicamento = snapshot.data![index];
                    var id = medicamento['id'];
                    return FadeIn(
                      duration: Duration(milliseconds: 2000 + index * 200),
                      child: ListTile(
                        title: Text(medicamento['nomeComercial'] ??
                            'Nome não disponível'),
                        subtitle: Text(medicamento['laboratorio'] ??
                            'Laboratório não disponível'),
                      ),
                    );
                  },
                ),
              );
            } else {
              return Center(
                child: Text('Nenhum medicamento encontrado'),
              );
            }
          }
        },
      ),
    );
  }
}
