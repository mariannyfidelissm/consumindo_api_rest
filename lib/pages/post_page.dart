import 'package:flutter/material.dart';

import '../models/post.dart';
import '../service/servico.dart';

class PagePost extends StatefulWidget {
  const PagePost({Key? key}) : super(key: key);

  @override
  State<PagePost> createState() => _PagePostState();
}

class _PagePostState extends State<PagePost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Posts")),
        body: FutureBuilder(
            future: HttpService.getPosts(),
            builder: (contexto, snapshot) {
              switch (snapshot.connectionState) {
                //case ConnectionState.active:
                case ConnectionState.waiting:
                  return const Center(child: CircularProgressIndicator());

                case ConnectionState.done:
                  if (snapshot.hasData) {
                    var posts = snapshot.data as List<Post>;

                    return ListView(
                      children: posts
                          .map(
                            (Post post) => ListTile(
                              leading: Icon(Icons.star),
                              title: Text(post.title),
                              subtitle: Text("${post.userId}"),
                            ),
                          )
                          .toList(),
                    );
                  } else {
                    return Center(child: Text('Sem dados'));
                  }

                default:
                  if (snapshot.hasError) {
                    return const Center(
                        child: Text("Erro ao carregar posts !"));
                  } else {
                    return const Center(
                      child: Text(
                        "Carregando...",
                        style: TextStyle(
                            color: Color.fromARGB(255, 35, 1, 85),
                            fontSize: 25.0),
                      ),
                    );
                  }
              }

              return Container();
            }));
  }
}
