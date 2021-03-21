import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_request/model/todo.dart';


class Homescreen extends StatefulWidget {
  Homescreen({Key key}) : super(key: key);

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<Todo> todos = [];
  Future fetchTodo() async {
      http.Response request = await http.get(
        Uri.parse(
          "https://jsonplaceholder.typicode.com/todos",
      ),
      );
      setState(() {
              todos = (jsonDecode(request.body) as List)
              .map(
                (json) => Todo.fromJson(json),
              )
              .toList();
            });
  }

  @override
  void initState(){
    fetchTodo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
         
      ),
      appBar: AppBar(
        title: Text(
          "Home Screen",
        ),
      ),
      body: Container(
        child: ListView(
          children: todos
          .map((item) => Card(
            child: ListTile(
              title: Text(
                item.title,
                ),
                subtitle: item.completed ? Text("เสร็จ") : Text("ไม่เสร็จ"),
            ),
          ))
          .toList(),
        ),
      ),
    );
  }
}