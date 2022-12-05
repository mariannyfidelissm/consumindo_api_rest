import 'package:flutter/material.dart';
import '../service/servico.dart';
import 'post_page.dart';

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
      appBar: AppBar(title: Text(widget.title), backgroundColor: Colors.black),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildRow(),
          FutureBuilder(
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
                          child: Text('Cidade: ${info['localidade']}'));
                    } else {
                      return const Center(child: Text('Sem dados'));
                    }
                  default:
                    if (snapshot.hasError) {
                      return const Center(
                          child: Text("Erro ao carregar dados !"));
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
              }),
        ],
      ),
      floatingActionButton: floatActionButton(
          context), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  FloatingActionButton floatActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (ctx) {
          return const PagePost();
        }));
      },
      tooltip: 'Send',
      backgroundColor: Colors.black,
      child: const Icon(Icons.get_app),
    );
  }

  Widget buildButton(String texto, IconData icone, Function f) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: OutlinedButton.icon(
        style: OutlinedButton.styleFrom(),
        onPressed: () => f(),
        icon: Icon(
          icone,
          color: Colors.black,
        ),
        label: Text(
          texto,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  Widget buildRow() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildButton('Enviar', Icons.send, HttpService.postExample),
          buildButton('Atualizar', Icons.refresh, HttpService.putExample),
          buildButton('Deletar', Icons.delete, HttpService.deleteExample),
          /*OutlinedButton.icon(
              onPressed: () => HttpService.postExample(),
              icon: Icon(Icons.send),
              label: Text('Enviar')),
          OutlinedButton.icon(
              onPressed: () => HttpService.putExample(),
              icon: Icon(Icons.refresh_outlined),
              label: Text('Atualizar')),
          OutlinedButton.icon(
              onPressed: () => HttpService.deleteExample(),
              icon: Icon(Icons.send),
              label: Text('Deletar'))*/
        ],
      ),
    );
  }
}
