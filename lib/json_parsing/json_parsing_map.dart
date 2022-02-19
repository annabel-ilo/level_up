import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:level_up/json_parsing/parsing_json.dart';
import 'package:level_up/model/post.dart';
import 'package:level_up/util/colors.dart';

class JsonParsingMap extends StatefulWidget {
  const JsonParsingMap({Key? key}) : super(key: key);

  @override
  _JsonParsingMapState createState() => _JsonParsingMapState();
}

class _JsonParsingMapState extends State<JsonParsingMap> {
  late Future<PostList> data;

  @override
  void initState() {
    super.initState();
    Network network = Network("https://jsonplaceholder.typicode.com/posts");
    data = network.loadPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'PODO',
      )),
      body: Center(
          child: Container(
        child: FutureBuilder(
            future: data,
            builder: (context, AsyncSnapshot<PostList> snapshot) {
              List<Post> allPosts;
              if (snapshot.hasData) {
                allPosts = snapshot.data!.posts;
                return createListView(allPosts, context);
              }
              return CircularProgressIndicator();
            }),
      )),
    );
  }
}

Widget createListView(List<Post> data, BuildContext context) {
  return Container(
    child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (contex, int index) {
          var primaryPurpleLight;
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Divider(
                height: 5.0,
                thickness: 5.0,
              ),
              ListTile(
                title: Text("${data[index].title}"),
                subtitle: Text("${data[index].body}"),
                tileColor: primaryPurpleLight,
                leading: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: primaryPurpleDark,
                      radius: 22.0,
                      child: Text("${data[index].id}"),
                    ),
                  ],
                ),
              )
            ],
          );
        }),
  );
}

class Network {
  final String url;

  Network(this.url);

  Future<PostList> loadPosts() async {
    final response = await get(Uri.parse(url));

    if (response.statusCode == 200) {
      return PostList.fromJson(json.decode(response.body));
    } else {
      throw Exception("failed to get post");
    }
  }
}
