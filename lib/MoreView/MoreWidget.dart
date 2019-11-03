import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smarthack_project/Data/Materie.dart';

import '../GlobalData.dart';

class MoreWidget extends StatefulWidget {
  @override
  _MoreWidgetState createState() => _MoreWidgetState();
}

class _MoreWidgetState extends State<MoreWidget> {

  var globalData = GlobalData();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          color: Colors.grey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.account_circle, size: 100),
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text("USERNAME", style: TextStyle(fontSize: 25, fontFamily: 'Raleway', color: Colors.white)),
                        Row(
                          children: <Widget>[
                            Text("Selected answers: 15 ",
                                style: TextStyle(fontSize: 15, fontFamily: 'Raleway', color: Colors.white)),
                            Icon(Icons.star, size: 20, color: Colors.yellow),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Sunt clasa a 7-a, imi place matematica!", style: TextStyle(fontSize: 20, fontFamily: 'Raleway', color: Colors.white))
                  ],
                ),
              )
            ],
          )
        ),
        ExpansionTile(
            title: Row(
              children: <Widget>[
                Icon(Icons.bookmark, size: 30),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text('Materii urmărite', style: TextStyle(fontSize: 20, fontFamily: 'Raleway')),
                ),
              ],
            ),
            children: buildList()
        ),

        ListTile(
          title: Row(
            children: <Widget>[
              Icon(Icons.assignment, size: 25),
              Text('Schimbă statusul', style: TextStyle(fontSize: 20, fontFamily: 'Raleway')),
            ],
          ),
          onTap: () {
          },
        ),
        ListTile(
          title: Row(
            children: <Widget>[
              Icon(Icons.assignment, size: 25),
              Text('Temă aplicație', style: TextStyle(fontSize: 20, fontFamily: 'Raleway')),
            ],
          ),
          onTap: () {
          },
        ),
      ],
    );
  }

  buildList() {
    return globalData.subscribed.map((data) => moreWidget(data)).toList();
  }

  Widget moreWidget(Materie data) {
    return InkWell(
      onTap: () {
        print("Mate");
      },
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: data.icon,
                ),
                Text(data.title, style: TextStyle(fontSize: 20, fontFamily: 'Raleway')),
              ],
            ),
            InkWell(
              onTap: () {
                setState(() {
                  globalData.subscribed.removeWhere((a) => a.title == data.title);
                });
              },
              child: Row(
                children: <Widget>[
                  Icon(Icons.remove_circle, color: Colors.red, size: 25,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
