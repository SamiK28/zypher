import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import './page2.dart';
String id="";
Map<dynamic,dynamic> authordetails =new Map();
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

class FrontPage extends StatefulWidget {
  @override
  _FrontPageState createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: ListView(
        padding: const EdgeInsets.only(top: 10.0),
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.grey.shade50),
            margin: const EdgeInsets.only(bottom: 30),
            height: 150.0,
            child: ListTile(
              dense: true,
              title: Container(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  'Authors',
                  style: Theme.of(context).textTheme.title,
                ),
              ),
              subtitle: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: data.length,
                itemBuilder: (context, i) {
                  return Container(
                    color: Colors.grey.shade100,
                    width: 100,
                    margin:
                        const EdgeInsets.only(right: 0, bottom: 10, top: 10),
                    child: ListTile(
                      onTap: () {
                        //print(data[i]["_id"]);
                         

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            //postRequest(data[i]["_id"]);
                            id=data[i]["_id"];
                            postRequest(id);
                            return Page2();
                            }),
                        );
                      },
                      contentPadding: const EdgeInsets.all(15),
                      title: CircleAvatar(
                        backgroundImage: NetworkImage(data[i]["authorImage"]),
                        radius: 35,
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Text(
                          data[i]["name"],
                          textAlign: TextAlign.center,
                        ),
                      ),
                      isThreeLine: true,
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 15),
            height: 130.0,
            child: ListTile(
              title: Container(
                padding: const EdgeInsets.only(left: 15, bottom: 10),
                child: Text(
                  'Popular Vacations',
                  style: Theme.of(context).textTheme.title,
                ),
              ),
              subtitle: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: assets.length,
                itemBuilder: (context, i) {
                  return Container(
                    color: Colors.grey.shade200,
                    padding: const EdgeInsets.all(1.5),
                    child: Stack(
                      children: <Widget>[
                        Card(
                          elevation: 20,
                          child: assets[i],
                        ),
                        Container(
                          child: Text(
                            names[i],
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ),
                          alignment: Alignment.bottomLeft,
                          padding: const EdgeInsets.all(10),
                        ),
                        Positioned(
                          bottom: 10,
                          right: 10,
                          child: Icon(
                            Icons.star,
                            color: Colors.yellow.shade600,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 60, bottom: 20),
            child: Text(
              'Explore by Category',
              style: Theme.of(context).textTheme.title,
              textAlign: TextAlign.center,
            ),
          ),
          GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: titles.length,
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemBuilder: (context, i) {
              return Card(
                  elevation: 5,
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    onTap: () {},
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          titles[i],
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.blue,
                          child: Text(titles[i][0]),
                        ),
                        Text(pro[i],
                            style: Theme.of(context).textTheme.caption),
                      ],
                    ),
                  ));
            },
          )
        ],
      ),
    );
  }
}

void postRequest(String id) async {
  var url = 'https://test-zypher.herokuapp.com/author/viewDetails';
  //Response response=new Response();
  Dio dio = new Dio();
  Map data = {"authorId": id};
  //encode Map to JSON
  //var body = json.encode(data);
  //response = await dio.post(url, data: data);
  http.Response response = await http.post(
    url,
    body: data,
  );
  authordetails=json.decode(response.body);
  // var authordets = json.decode(response.body);
  // JsonEncoder encoder = new JsonEncoder.withIndent('  ');
  // String prettyprint = encoder.convert(authordetails);
  //print(prettyprint);
  //print(authordetails["author"].keys);
  //print(authordetails);
  //return authordets;
}
