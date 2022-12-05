import 'dart:convert';
import '../models/cep.dart';
import '../models/post.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
    debugPrint("Dado retornado pelo Dio - ${response.data}");
    var map = response.data as Map<String, dynamic>;
    //var mapa = jsonDecode(response.data);
    debugPrint("Dio - ${response.headers} ${response.statusCode}");
    debugPrint("Dio - ${map['cep']}");

    CEP c = CEP.fromJson(map);
    debugPrint(c.cep);
    return map;
  }

  Future<Map> getDat() async {
    var viaCep = "https://viacep.com.br/ws/62820000/json/";
    http.Response resp = await http.get(Uri.parse(viaCep));
    debugPrint(resp.body);
    var mapa = jsonDecode(resp.body);
    debugPrint(mapa['cep']);

    return mapa;
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

    var requestPost = json.encode({
      "userId": 1,
      "id": 1,
      "title": "Exemplo título a ser enviado",
      "body": "Corpo da mensagem"
    });

    var response = await http.post(
      Uri.parse(postsURL),
      headers: {"Content-type": "application/json; charset=UTF-8"},
      body: requestPost,
    );

    debugPrint("Status retorno - ${response.statusCode}");
    debugPrint("Corpo da response - ${response.body}");
  }

  static void putExample() async {
    /*Observar o ENDPOINT da API para envio/atulização de dados*/
    /*O put difere-se do patch pois necessita o envio de todo o objeto */
    const String postsURL = "https://jsonplaceholder.typicode.com/posts/1";

    var requestPut = json.encode({
      "userId": 2,
      "id": 2,
      "title": "Exemplo título a ser atualizado",
      "body": "Corpo da mensagem atualizada"
    });

    var response = await http.put(Uri.parse(postsURL),
        headers: {"Content-type": "application/json; charset=UTF-8"},
        body: requestPut);

    debugPrint(response.statusCode.toString());
  }

  void patchExample() async {
    //Correção de um recurso
    const String postsURL = "https://jsonplaceholder.typicode.com/";

    var requestPatch = json.encode({
      "title": "Exemplo título a ser atualizado com o patch",
      "body": "Corpo da mensagem atualizada com o patch"
    });

    var response = await http.put(Uri.https(postsURL, "/posts/2"),
        headers: {"Content-type": "application/json; charset=UTF-8"},
        body: requestPatch);

    debugPrint(response.statusCode.toString());
  }

  static void deleteExample() async {
    //Deleção de um recurso
    const String postsURL = "https://jsonplaceholder.typicode.com/posts/1";
    var response = await http.delete(Uri.parse(postsURL));
    debugPrint(response.statusCode.toString());
  }
}
