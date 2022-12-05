import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/cep.dart';
import '../models/post.dart';

class APIService {
  static Future<Map> getDataCEP() async {
    await Future.delayed(Duration(seconds: 3), () {});
    var viaCep = "https://viacep.com.br/ws/62820000/json/";
    http.Response resp = await http.get(Uri.parse(viaCep));
    debugPrint(resp.body);
    var mapa = jsonDecode(resp.body);
    debugPrint(mapa['cep']);

    //debugPrint(mapa.toString());
    return mapa;
  }

  static Future<Map> getDataCEP2() async {
    await Future.delayed(const Duration(seconds: 3), () {});
    var viaCep = "viacep.com.br";
    http.Response resp =
        await http.get(Uri.https(viaCep, "/ws/62820000/json/"));
    print(resp.body);
    var mapa = jsonDecode(resp.body);
    debugPrint(mapa['cep']);

    return mapa;
  }

  static Future<Map> getDataCEPDio() async {
    var viaCep = "https://viacep.com.br/ws/62820000/json/";

    Dio d = Dio();
    var response = await d.get(viaCep);
    debugPrint("Dioxx - ${response.data}");
    var map = response.data as Map<String, dynamic>;
    //var mapa = jsonDecode(response.data);
    debugPrint("Dio - ${response.headers} ${response.statusCode}");
    debugPrint("Dio - ${map['cep']}");

    CEP c = CEP.fromJson(map);
    debugPrint(c.cep);
    return map;
  }
}

class HttpService {
  static Future<List<Post>> getPosts() async {
    const String postsURL = "https://jsonplaceholder.typicode.com/posts";
    var res = await http.get(Uri.parse(postsURL));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Post> posts = body
          .map(
            (dynamic item) => Post.fromJson(item),
          )
          .toList();

      return posts;
    } else {
      throw "Unable to retrieve posts.";
    }
  }

  static void postExample() async {
    /*Observar o ENDPOINT da API para envio/atulização de dados*/
    const String postsURL = "https://jsonplaceholder.typicode.com/posts";

    var request_post = json.encode({
      "userId": 1,
      "id": 1,
      "title": "Exemplo título a ser enviado",
      "body": "Corpo da mensagem"
    });

    var response = await http.post(
      Uri.parse(postsURL),
      headers: {"Content-type": "application/json; charset=UTF-8"},
      body: request_post,
    );

    debugPrint("Status retorno - ${response.statusCode}");
    debugPrint("Corpo da response - ${response.body}");
  }

  static void putExample() async {
    /*Observar o ENDPOINT da API para envio/atulização de dados*/
    const String postsURL = "https://jsonplaceholder.typicode.com/posts";
  }
}
