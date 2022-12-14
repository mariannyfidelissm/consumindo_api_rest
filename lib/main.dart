import 'package:flutter/material.dart';
import 'pages/home.dart';

void main() async {
  //await APIService.getDataCEP();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter API',
      home: MyHomePage(title: "App - Exemplo consulta WebService"),
      debugShowCheckedModeBanner: false,
    );
  }
}
