import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http_request/model/photo.dart';
import 'package:http/http.dart' as http;

class Galleryscreen extends StatefulWidget {
  Galleryscreen({Key key}) : super(key: key);

  @override
  _GalleryscreenState createState() => _GalleryscreenState();
}

class _GalleryscreenState extends State<Galleryscreen> {
  List<Photo> photos = [];
  Future fetchPhoto() async {
      http.Response response = await http.get(
        Uri.parse(
          "https://jsonplaceholder.typicode.com/photos",
      ),
      );
      setState(() {
              photos = (jsonDecode(response.body) as List)
              .map(
                (json) => Photo.fromJson(json),
              )
              .toList();
            });
  }
  @override
  void initState(){
    fetchPhoto();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        title: Text(
          "Home Screen",
        ),
      ),
      body: Container(
        child: ListView(
          children: photos
          .map((item) => Card(
            child: ListTile(
              title: Text(
                item.title,
                ),
                
            ),
          ))
          .toList(),
        ),
      ),
      
    );
  }
}