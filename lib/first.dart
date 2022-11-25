import 'package:flutter/material.dart';

class first extends StatefulWidget {
  String m, m2;

  first(this.m, this.m2);

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Text("${widget.m}"),
              Text("${widget.m2}"),
            ],
          );
        },
      ),
    );
  }
}
