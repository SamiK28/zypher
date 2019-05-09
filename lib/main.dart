import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MaterialApp(
      title: 'zypher',
      home: MyApp(),
      theme: ThemeData(
        iconTheme: IconThemeData(color: Colors.black26),
        primaryColor: Colors.white,
        accentColor: Colors.blueAccent,
      ),
      debugShowCheckedModeBanner: false,
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: ListView(
          padding: const EdgeInsets.only(top:10.0),
          children: <Widget>[
           
            Container(             
              height: 150.0,
              child: ListTile(
                title: Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Authors',
                    style: Theme.of(context).textTheme.title, 
                  ),
                ),
                subtitle: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 15,
                  itemBuilder: (context, i) {
                    return Container(
                      color: Colors.amber,
                      width: 100,
                      margin: const EdgeInsets.only(right:10,bottom: 10,top: 10),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _appbar() {
    return AppBar(

      title: Row(
        children: <Widget>[
          Flexible(
            child: Icon(Icons.menu),
            fit: FlexFit.tight,
            flex: 1,
          ),
          Text(
            "#zypher",
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 20,
            ),
          ),
        ],
      ),
      actions: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
          iconSize: 20,
        ),
        IconButton(
          icon: Icon(Icons.notifications),
          onPressed: () {},
          iconSize: 20,
        ),
        IconButton(
          icon: Icon(Icons.book),
          onPressed: () {},
          iconSize: 20,
        ),
        IconButton(
          icon: Icon(Icons.card_travel),
          onPressed: () {},
          iconSize: 20,
        ),
          ],
        ),
        CircleAvatar(
          backgroundColor: Colors.amber,
          radius: 17,
          child: Container(
            alignment: Alignment.bottomRight,
            child: CircleAvatar(
              backgroundColor: Colors.green,
              radius: 6.5,
            ),
            padding: const EdgeInsets.only(right: 1, bottom: 7.5),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 5),
          
        )
      ],
    );
  }
}
