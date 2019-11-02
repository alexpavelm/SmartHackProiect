import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainWidget extends StatefulWidget {
  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  final myController = TextEditingController();

  Future listMaterii() {
    return showDialog(
        context: context,
        builder: (context) {
          return Container(
            child: AlertDialog(
              title: Text("Materii posibile: "),
              content: SizedBox(
                width: MediaQuery.of(context).size.height * 0.8,
                height: MediaQuery.of(context).size.width * 0.7,
                child: ListView.separated(
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          Navigator.of(context).pop();
                        });
                      },
                      child: ListTile(
                        title: Row(
                          children: <Widget>[
                            Text(
                              "Matematica",
                              style: TextStyle(fontSize: 12),
                            ),
                            Text(
                              "Fizica",
                              style: TextStyle(fontSize: 12),
                            ),
                            Text(
                              "Chimie",
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(color: Colors.black);
                  },
                ),
              ),
            ),
          );
        });
  }

  void searchInList(String topic) {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            color: Colors.lightBlue,
            child: Text(
              "Selectati Materia",
            ),
            onPressed: () {
              listMaterii();
            },
          ),
          Container(
            width: 100,
            child: TextField(
              controller: myController,
            ),
          ),
          RaisedButton(
            color: Colors.lightBlue,
            onPressed: () {
              searchInList(myController.text);
            },
            child: Text("Search"),
          ),
      ]
    )
    )
    );
  }
}
