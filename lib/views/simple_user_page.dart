import 'package:flutter/material.dart';
import 'package:novatela/services/simple_user/medicamentos_todos_get_http.dart';
import 'package:novatela/views/simple_user/user_page_list.dart';
import 'package:novatela/views/simple_user/user_page_search.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:novatela/provider/user_provider.dart';

class SimpleUserPage extends StatefulWidget {
  @override
  _SimpleUserPageState createState() => _SimpleUserPageState();
}

class _SimpleUserPageState extends State<SimpleUserPage> {
  final MedicamentosTodosGetHttp medicamentosProvider =
      MedicamentosTodosGetHttp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<UserProvider>(
          builder: (context, userProvider, _) {
            final userName = userProvider.userName;
            return Text(
              'Bem-vindo Ao Bula Online $userName!',
              style: TextStyle(fontSize: 15),
            );
          },
        ),
        backgroundColor: Color.fromARGB(255, 130, 225, 238),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: Colors.deepOrange,
              width: 2.0,
            ),
          ),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                FutureBuilder<List<dynamic>?>(
                  future: medicamentosProvider.getMedicamentos(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text(
                          'Erro ao carregar medicamentos: ${snapshot.error}');
                    } else if (snapshot.data == null ||
                        snapshot.data!.isEmpty) {
                      return Text('Nenhum medicamento disponível');
                    } else {
                      return CarouselSlider.builder(
                        itemCount: snapshot.data!.length,
                        options: CarouselOptions(
                          height: 250,
                          enlargeCenterPage: true,
                          viewportFraction: 0.5,
                          aspectRatio: 2.0, // Ajuste conforme necessário
                        ),
                        itemBuilder: (context, index, realIndex) {
                          return Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              '${snapshot.data![index]["nomeComercial"] ?? 'Medica'}',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
                SizedBox(height: 8),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserPageSearch()),
                        );
                      },
                      child: Text('Pesquisar Medicamentos'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Ação quando o segundo botão da primeira linha é pressionado
                      },
                      child: Text('Medicamentos Favoritos'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserPageList()),
                        );
                      },
                      child: Text('Lista de todos Medicamentos'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 22, vertical: 20),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
