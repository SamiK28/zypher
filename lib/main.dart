import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './body.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import './appbar.dart';
import './data.dart';
void main() async{

  Map<dynamic,dynamic> dummy= await getJSON();
  data=dummy["authors"];


  return runApp(MaterialApp(
    title: 'zypher',
    home: MyApp(),
    theme: ThemeData(
        iconTheme: IconThemeData(color: Colors.grey.shade700),
        //primarySwatch: Colors.grey.shade700,
        primaryColor: Colors.white,
        accentColor: Colors.blueAccent,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      body: FrontPage(),
    );
  }

  }



  Future<Map<dynamic, dynamic>> getJSON() async {
    String res = 'https://test-zypher.herokuapp.com/author/getAllAuthor';
    http.Response response = await http.get(res);
    return json.decode(response.body);
}




