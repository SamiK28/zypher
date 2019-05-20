import 'package:flutter/material.dart';


List books = new List();

List booknames = new List();

String pop ="";

String id = "";
List<Map<dynamic,dynamic>> authors= new List();
Map<dynamic, dynamic> authordetails = new Map();

List data = new List();

List titles = [
  'FICTION',
  'NON-FICTION',
  'Exam Corner',
  'KIDS',
  'Engineering',
  'Medicine',
  'Law',
  'Computer Science'
];

List pro = [
  '16 Downloads',
  '3 Sections Finished',
  '8 Passed',
  '2 Times Winner',
  '16 Downloads',
  '3 Sections Finished',
  '8 Passed',
  '2 Times Winner',
];

List<Widget> assets = [
  Image.asset(
    'images/1.jpeg',
    fit: BoxFit.cover,
  ),
  Image.asset(
    'images/2.jpeg',
    fit: BoxFit.fill,
  ),
  Image.asset(
    'images/3.jpeg',
    fit: BoxFit.fill,
  ),
  Image.asset(
    'images/4.jpeg',
    fit: BoxFit.fill,
  ),
  Image.asset(
    'images/5.jpeg',
    fit: BoxFit.fill,
  ),
  Image.asset(
    'images/6.jpeg',
    fit: BoxFit.fill,
  ),
  Image.asset(
    'images/7.jpeg',
    fit: BoxFit.fill,
  ),
  Image.asset(
    'images/8.jpeg',
    fit: BoxFit.fill,
  ),
];


List<String> names = [
  'Madrid',
  'Paris',
  'Warsaw',
  'Old Factory',
  'Modern Hotel',
  'Barcelona',
  'Wall Street',
  "App'n'Roll Office"
];