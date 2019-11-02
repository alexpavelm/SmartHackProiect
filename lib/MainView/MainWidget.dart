import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smarthack_project/Data/Chapter.dart';
import 'package:smarthack_project/Data/Materie.dart';
import 'package:smarthack_project/Data/Question.dart';
import 'package:smarthack_project/Data/SearchResult.dart';
import 'package:smarthack_project/Data/TopicResult.dart';

import '../GlobalData.dart';
import 'SearchResultWidget.dart';

class MainWidget extends StatefulWidget {
  static final _formKey = GlobalKey<FormState>();
  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  final myController = TextEditingController();
  var globalData = GlobalData();
  int materieSelectata;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
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
          Form(
            key: MainWidget._formKey,
            child: Container(
              width: 300,
              child: new Theme(
                  data: new ThemeData(
                    primaryColor: Colors.blue,
                  ),
                  child: TextFormField(
                    controller: myController,
                    decoration: new InputDecoration(
                      labelText: "Caută un subiect",
                      fillColor: Colors.white,
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: const BorderSide(
                            color: Colors.black, width: 0.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: BorderSide(color: Colors.blue)),
                      //fillColor: Colors.green
                    ),
                    validator: (val) {
                      if (val.length == 0) {
                        return "Inserează un text";
                      } else {
                        return null;
                      }
                    },
                    style: new TextStyle(
                        fontFamily: "Poppins",),
                  ))
            ),
          ),
                  getDataButton(),
        ])));
  }

  Future listMaterii() {
    var globalData = GlobalData();
    return showDialog(
        context: context,
        builder: (context) {
          return Container(
            child: AlertDialog(
              title: Text("Materie:"),
              content: SizedBox(
                width: MediaQuery.of(context).size.height * 0.8,
                height: MediaQuery.of(context).size.width * 0.7,
                child: ListView.separated(
                  itemCount: globalData.materii.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          materieSelectata = index;
                          Navigator.of(context).pop();
                        });
                      },
                      child: ListTile(
                        title: Row(
                          children: <Widget>[
                            Text(globalData.materii[index].title)
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

  Widget getDataButton() {

    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection("questions").snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Center(child: CircularProgressIndicator(),);
        globalData.questions = snapshot.data.documents;
        globalData.questions.sort((a, b) =>
            Chapter
                .fromSnapshot(a)
                .id
                .compareTo(Chapter
                .fromSnapshot(b)
                .id));
        if (globalData.questions == null) {
          globalData.questions = new List();
        }
        return RaisedButton(
          textColor: Colors.white,
          color: Colors.blue,
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0),
          ),
          onPressed: () {
            // Validate returns true if the form is valid, or false
            // otherwise.
            if (MainWidget._formKey.currentState.validate()) {
              FocusScope.of(context).unfocus();
              searchData(globalData.materii[materieSelectata]);
            }
          },
          child: Text('Căutare'),
        );

      },
    );
  }

  void searchData(Materie materie) {
        SearchResult searchResult = new SearchResult(new TopicResult("Matematica", "Matrici",
        Chapter.fromSnapshot(globalData.matrici[0])), globalData.questions);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SearchResultWidget(searchResult)),
        );
  }
}
