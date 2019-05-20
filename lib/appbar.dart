import 'package:flutter/material.dart';


 Widget appbar() {
    return AppBar(
      title:  Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          //Icon(Icons.menu),
          Container(
            margin: const EdgeInsets.only(left: 00),
            child: Text(
              "#",
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 20,
                  color: Colors.green.shade900),
            ),
          ),
          Text(
            "zypher",
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 23,
            ),
          ),
        ],
      ),
      actions: <Widget>[
        ButtonBar(
          alignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(
              Icons.search,
              size: 20,
            ),
            Icon(
              Icons.notifications,
              size: 20,
            ),
            Icon(
              Icons.book,
              size: 20,
            ),
            Icon(
              Icons.card_travel,
              size: 20,
            ),
          ],
          mainAxisSize: MainAxisSize.min,
        ),
        Container(
                   width: 34.0,
                   height: 20.0,
                   margin: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover, image: AssetImage('images/22.jpeg'),
                  ),
                ),
                child: Container(
                   alignment: Alignment.bottomRight,
                    child: CircleAvatar(
                           backgroundImage: AssetImage('images/9.png'),
                              radius: 6.5,
                              ),
                       padding: const EdgeInsets.only(right: 1),
                      ),
        ),
        // CircleAvatar(
        //   backgroundImage:  NetworkImage("https://cdn.dribbble.com/users/1041205/screenshots/3636353/dribbble.jpg"),
        //   maxRadius: 16.5,
        //   child: Container(
        //     alignment: Alignment.bottomRight,
        //     child: CircleAvatar(
        //       backgroundImage: AssetImage('images/9.png'),
        //       radius: 6.5,
        //     ),
        //     padding: const EdgeInsets.only(right: 2, bottom: 11),
        //   ),
        // ),
        Padding(
          padding: const EdgeInsets.only(right: 5),
        ),
      ],
    );
  }
