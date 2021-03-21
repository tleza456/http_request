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
         child: ListView(
          children: [         
            DrawerHeader(
              margin: EdgeInsets.zero,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://r1.ilikewallpaper.net/ipad-pro-wallpapers/download/100054/abstract-material-design-4k-ipad-pro-wallpaper-ilikewallpaper_com.jpg"
                  ),
                  fit : BoxFit.cover
                  ),
              ),
              child: Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage("https://www.yingpook.com/static/assets/uploads/wp-content/uploads/2020/08/shutterstock_1294829227.jpg"),
                    ),
                    Text("วัด"),
                  ],
                ),
              ),
              ),
            
             ListTile(
                 onTap: (){
                   Navigator.pushNamed(context, '/gallery');
                 },
              leading: Icon(Icons.account_balance_sharp),
              title: Text("gallery"),
            ),
          ],
        ),
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