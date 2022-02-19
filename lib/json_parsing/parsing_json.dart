import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:core';

import 'package:level_up/util/colors.dart';

class JsonParsingSimple extends StatefulWidget {
  const JsonParsingSimple({Key? key}) : super(key: key);

  @override
  _JsonParsingSimpleState createState() => _JsonParsingSimpleState();
}

class _JsonParsingSimpleState extends State<JsonParsingSimple> {
  late Future data;

  @override
  void initState() {
    super.initState();
    data = getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('JSON Parsing')),
      body: Center(
          child: Container(
        child: FutureBuilder(
            future: getData(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                // return Text(snapshot.data[0]["userId"].toString());
                return createListView(snapshot.data, context);
              }
              return CircularProgressIndicator();
            }),
      )),
    );
  }

  Future getData() async {
    var data;

    String url = "https://jsonplaceholder.typicode.com/posts";
    Network network = Network(url);

    data = network.fetchData();

    return data;
  }

  Widget createListView(List data, BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (contex, int index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                 Divider(
                        height: 5.0,
                        thickness: 5.0,
                      ),
                ListTile(
                  title: Text("${data[index]["title"]}"),
                  subtitle: Text("${data[index]["body"]}"),
                  leading: Column(
                    children: [
                        CircleAvatar(
                        backgroundColor: primaryPurpleLight,
                        radius:22.0,
                        child: Text("${data[index]["id"]}"),
                      ),
                    ],
                  ),
                )
              ],
            );
          }),
    );
  }
}

class Network {
  final String url;

  Network(this.url);

  Future fetchData() async {
    print("$url");

    Response response = await get(Uri.parse(url));

    if (response.statusCode == 200) {
      print(response.body);
      return json.decode(response.body);
    } else {
      print(response.statusCode);
    }
  }
}
