import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../GlobalData.dart';
import '../LoginPage.dart';

class NewQuestion extends StatefulWidget {
  @override
  _NewQuestionState createState() => _NewQuestionState();
}

class _NewQuestionState extends State<NewQuestion> {
  var materieSelectata;
  final myController = TextEditingController();
  final myController2 = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  var globalData = GlobalData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 100,
          width: 400,
          child: RaisedButton(
            child: Text(
              "Pune o întrebare",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Raleway',
                  fontSize: 30),
            ),
            textColor: Colors.white,
            color: Colors.green.shade300,
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(15.0),
            ),
            onPressed: () {
            },
          ),
        ),
        RaisedButton(
          child: Text(
            materieSelectata == null
                ? "Selectează materia"
                : globalData.materii[materieSelectata].title,
            style: TextStyle(color: Colors.white, fontFamily: 'Raleway'),
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
        Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formKey2,
              child: Container(
                  width: 300,
                  child: new Theme(
                      data: new ThemeData(
                        primaryColor: Colors.blue.shade300,
                      ),
                      child: TextFormField(
                        controller: myController,
                        decoration: new InputDecoration(
                            labelText: "Titlul întrebării",
                            fillColor: Colors.white,
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(25.0),
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 0.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(25.0),
                                borderSide:
                                    BorderSide(color: Colors.blue.shade300)),
                            labelStyle: TextStyle(fontFamily: 'Raleway')
                            //fillColor: Colors.green
                            ),
                        validator: (val) {
                          if (val.length == 0) {
                            return "Inserează un titlu";
                          } else {
                            return null;
                          }
                        },
                        style: new TextStyle(
                          fontFamily: "Poppins",
                        ),
                      ))),
            ),
          ),
          Container(
              width: 300,
              child: new Theme(
                  data: new ThemeData(
                    primaryColor: Colors.blue.shade300,
                  ),
                  child: Container(
                    child: TextFormField(
                      controller: myController2,
                      decoration: new InputDecoration(
                          labelText: "Descriere",
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide:
                                const BorderSide(color: Colors.black, width: 0.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(25.0),
                              borderSide:
                                  BorderSide(color: Colors.blue.shade300)),
                          labelStyle: TextStyle(fontFamily: 'Raleway')
                          //fillColor: Colors.green
                          ),
                      validator: (val) {
                        if (val.length == 0) {
                          return "Inserează un titlu";
                        } else {
                          return null;
                        }
                      },
                      maxLines: 5,
                      style: new TextStyle(
                        fontFamily: "Poppins",
                      ),
                    ),
                  ))),
          RaisedButton(
            child: Text("Trimite",
              style: TextStyle(color: Colors.white, fontFamily: 'Raleway'),
            ),
            textColor: Colors.black.withOpacity(0.6),
            color: materieSelectata == null ? Colors.grey : Colors.blue.shade300,
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0),
            ),
            onPressed: () {
              setState(() {
                _storeData();
                Navigator.of(context).pop();
              });
            },
          ),
        ]),
      ],
    )));
  }

  Widget getDataButton() {
    var globalData = GlobalData();
    if (globalData.questions == null) {
      globalData.questions = new List();
    }

    return InkWell(
      child: Icon(
        FontAwesomeIcons.search,
        size: 30,
        color: Colors.green.shade300,
      ),
      onTap: () {
        if (globalData.formKey.currentState.validate()) {
          FocusScope.of(context).unfocus();
          _storeData();
        }
      },
    );
  }

  void _storeData() async {
    var globalData = GlobalData();
    var now = DateTime.now();
    String date = now.day.toString() +
        "/" +
        now.month.toString() +
        "/" +
        now.year.toString() +
        "/" +
        now.hour.toString() +
        ":" +
        now.minute.toString();
    String text = myController.text;
    String text2 = myController2.text;
    await Firestore.instance.collection("questions").add({
      'answers': 0,
      'author': globalData.user.author,
      'id': 15,
      'icon': globalData.user.icon,
      'time': date,
      'title' : text,
      'text' : text2,
      'materie' : globalData.materii[materieSelectata].title,
      'keywords' : "",
      'isAnswered' : false
    });
    myController.clear();
    myController2.clear();
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
}
