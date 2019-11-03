import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smarthack_project/Data/Chapter.dart';
import 'package:smarthack_project/Data/Chapter.dart' as prefix0;
import 'package:smarthack_project/Data/Materie.dart';
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
  bool searchValid = false;
  int score;
  List<String> searchKeywords;
  List<int> scores;
  List<String> word;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
          child: Text(
            materieSelectata == null
                ? "Selectează materia"
                : globalData.materii[materieSelectata].title,
            style: TextStyle(color: Colors.white),
          ),
          textColor: Colors.black.withOpacity(0.6),
          color: materieSelectata == null ? Colors.grey : Colors.blue.shade300,
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0),
          ),
          onPressed: () {
            setState(() {
              listMaterii();
            });
          },
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Form(
            key: MainWidget._formKey,
            child: Container(
                width: 300,
                child: new Theme(
                    data: new ThemeData(
                      primaryColor: Colors.indigoAccent,
                    ),
                    child: TextFormField(
                      controller: myController,
                      decoration: new InputDecoration(
                        labelText: "Caută un subiect",
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide:
                              const BorderSide(color: Colors.black, width: 0.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: BorderSide(color: Colors.indigoAccent)),
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
                        fontFamily: "Poppins",
                      ),
                    ))),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: getDataButton(),
          ),
        ]),
      ],
    )));
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
                          searchValid = true;
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
    if (globalData.questions == null) {
      globalData.questions = new List();
    }

    return InkWell(
      child: Icon(
        FontAwesomeIcons.search,
        size: 30,
        color: searchValid ? Colors.indigoAccent : Colors.grey,
      ),
      onTap: () {
        if (MainWidget._formKey.currentState.validate()) {
          if (searchValid) {
            FocusScope.of(context).unfocus();
            searchData(globalData.materii[materieSelectata]);
          }
        }
      },
    );
  }

  void searchData(Materie materie) {
    searchKeywords = myController.toString().toLowerCase().split(" ");

    for (int i = 0; i < GlobalData().matrici.length; i++) {
      var capitol = Chapter.fromSnapshot(GlobalData().matrici[i]);
      var keywords = capitol.keywords.split(",");
      for (String i in searchKeywords) {
        for (String j in keywords) {
          if (i == j) {
            score++;
          }
          scores.add(score);
          word.add(j);
        }
      }
    }

    var count = scores[0];
    var pos = 0;
    for (int i = 0; i < scores.length; i++) {
      if (scores[i] > count) {
        pos = i;
      }
    }

    Chapter chapter;

    for (int i = 0; i < GlobalData().matrici.length; i++) {
      var capitol = Chapter.fromSnapshot(GlobalData().matrici[i]);
      var keywords = capitol.keywords.split(",");
      for (String j in keywords) {
        if (word[pos] == j) {
           chapter = Chapter.fromSnapshot(GlobalData().matrici[i]);
           break;
        }
      }
    }

    SearchResult searchResult = new SearchResult(
        new TopicResult(materie.title, word[pos],
            chapter),
        globalData.questions);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SearchResultWidget(searchResult)),
    );
  }
}
