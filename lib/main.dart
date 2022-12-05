import 'package:consumindo_api_rest/pages/post_page.dart';
import 'package:consumindo_api_rest/service/servico.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<Map> getDat() async {
  var viaCep = "https://viacep.com.br/ws/62820000/json/";
  http.Response resp = await http.get(Uri.parse(viaCep));
  print(resp.body);
  var mapa = jsonDecode(resp.body);
  print(mapa['cep']);

  //print(mapa);
  return mapa;
}

void main() async {
  await APIService.getDataCEP();
  //SharedPreferences prefers = SharedPreferenes.instance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter API',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo API'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: FutureBuilder(
          future: APIService.getDataCEPDio(),
          builder: (contexto, snapshot) {
            switch (snapshot.connectionState) {
              //case ConnectionState.active:
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());
              case ConnectionState.done:
                if (snapshot.hasData) {
                  var info = snapshot.data as Map<String, dynamic>;
                  return Center(
                      child:
                          Container(child: Text('info ${info['localidade']}')));
                } else {
                  return Center(child: Text('Sem dados'));
                }
              default:
                if (snapshot.hasError) {
                  return const Center(child: Text("Erro ao carregar dados !"));
                } else {
                  return const Center(
                    child: Text(
                      "Carregando...",
                      style: TextStyle(
                          color: Color.fromARGB(255, 81, 13, 182),
                          fontSize: 25.0),
                    ),
                  );
                }
            }

            return Container();
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (ctx) {
            return PagePost();
          }));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
