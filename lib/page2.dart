import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './data.dart';
import './body.dart';

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {

  @override
  Widget build(BuildContext context) {
    
    books = authordetails["books"];
      pop=authordetails["isPopular"]
    ? authordetails["isPublic"]
        ? "A very Popular Author and a Public Figure"
        : "A very Popular Author"
    : "";
    for (int i = 0; i < books.length; i++) {
      booknames.add(books[i]["productName"]);
    }
    booknames.sort();
    books.sort((a, b) {
      a = books[0]["productName"];
      b = books[1]["productName"];
      return a.compareTo(b);
    });
    return authordetails.isNotEmpty?Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                color: Colors.red.shade600,
                child: Container(
                  width: 400,
                  decoration: BoxDecoration(
                    //borderRadius: BorderRadius.circular(1000),
                    borderRadius: new BorderRadius.circular(25.0),
                    color: Colors.red.shade600,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.chevron_left,
                          color: Colors.white,
                          size: 28,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                            authordetails["authorImage"],
                          ),
                          radius: 30,
                        ),
                        title: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            authordetails["name"],
                            style: TextStyle(
                                color: Colors.white,
                                fontStyle: FontStyle.italic,
                                fontSize: 20),
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${authordetails["authorBio"]}\n\n" + pop,
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ),
                        isThreeLine: true,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,

              child: Container(
                //color: Colors.blue,
                child: GridView.builder(
                  padding: const EdgeInsets.all(15),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, i) {
                    return Container(
                      //color: Colors.amber,
                      margin: const EdgeInsets.all(10),
                      child: ListTile(
                        title: Image(
                          image: NetworkImage(books[i]["imageURL"]),
                        ),
                        subtitle: Text("\n${books[i]["productName"]}\n" +
                            "by " +
                            books[i]["authorName"]),
                      ),
                    );
                  },
                  itemCount: authordetails["books"].length,
                ),
              ),
            ),
          ],
        ),
      ),
    ):Material(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
