import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'first.dart';

void main() {
  runApp(MaterialApp(
    home: home(),
  ));
}

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();

  Future postdata() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("post data")),
      body: Column(
        children: [
          TextField(
            controller: t1,
          ),
          TextField(
            controller: t2,
          ),
          ElevatedButton(
              onPressed: () async {
                String name = t1.text;
                String job = t2.text;
                var url = Uri.https('reqres.in', 'api/users');
                var response =
                    await http.post(url, body: {'name': name, 'job': job});
                print('Response body: ${response.body}');
                Map m = jsonDecode(response.body);

                print("${m['name']}");
                print("${m['job']}");
                print("${m['id']}");
                print("${m['createdAt']}");
                print("");
                t1.text="";
                t2.text="";
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return first(m['name'],m['job']);
                },));
              },
              child: Text("Insert"))
        ],
      ),
    );
  }
}
