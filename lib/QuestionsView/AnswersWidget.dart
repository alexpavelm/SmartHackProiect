import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smarthack_project/Data/Answer.dart';
import 'package:smarthack_project/Data/Question.dart';
import 'package:smarthack_project/QuestionsView/QuestionCard.dart';

import '../GlobalData.dart';

class AnswersWidget extends StatefulWidget {
  Question question;

  AnswersWidget(this.question);

  @override
  _AnswersWidgetState createState() => _AnswersWidgetState();
}

class _AnswersWidgetState extends State<AnswersWidget> {
  List<DocumentSnapshot> answers;
  final myController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isValid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Răspunsuri",
            style: TextStyle(
                color: Colors.white, fontSize: 28, fontFamily: 'Raleway')),
        backgroundColor: Colors.blue.shade300,
        elevation: 0,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: getData(),
        ),
      ),
    );
  }

  Widget getData() {
    return StreamBuilder<QuerySnapshot>(
      stream: widget.question.reference.collection("answers").snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(
            child: CircularProgressIndicator(),
          );
        answers = snapshot.data.documents;
        answers.sort((a, b) =>
            Answer.fromSnapshot(a).id.compareTo(Answer.fromSnapshot(b).id));
        if (answers == null) {
          answers = new List();
        }
        return buildList();
      },
    );
  }

  Widget answerCard(DocumentSnapshot data) {
    Answer answer = Answer.fromSnapshot(data);
    var globalData = GlobalData();
    final int id = answer.id;
    final String text = answer.text;
    final String author = answer.author;
    String time = answer.time;
    String duration = getTime(time);
    return Card(
      color: answer.id == 0 ? Colors.green.shade100 : Colors.grey.shade300,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              widget.question.author == globalData.user.author ? InkWell(
                child: InkWell(
                  child: Icon(
                    answer.id == 0 ? Icons.star : Icons.star_border,
                    size: 35,
                    color: Colors.grey,
                  ),
                  onTap: () {
                    setState(() {
                      _updateAnswer(data);
                    });

                  },
                ),
              ) : SizedBox.shrink(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              answer.id == 0
                                  ? Row(
                                      children: <Widget>[
                                        Text(
                                          "Răspuns ales",
                                          style: TextStyle(
                                              fontSize: 12, color: Colors.grey),
                                        ),
                                        Icon(
                                          FontAwesomeIcons.check,
                                          color: Colors.green,
                                          size: 12,
                                        )
                                      ],
                                    )
                                  : SizedBox.shrink(),
                              Container(
                                width: 350,
                                child: Text(
                                  text,
                                  style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                  maxLines: 3,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            duration,
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      answer.icon == null
                          ? Icon(
                              Icons.account_circle,
                              size: 45,
                              color: Colors.grey,
                            )
                          : CircleAvatar(
                              radius: 20,
                              backgroundImage: NetworkImage(
                                answer.icon,
                              ),
                            ),
                      Text(author,
                          style: TextStyle(color: Colors.grey, fontSize: 10))
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String getTime(String time) {
    List<String> tokens = time.split("/");
    List<String> hour = tokens[3].split(":");
    String my_time = "";

    var now = DateTime.now();
    var date = DateTime((int.parse(tokens[2])), (int.parse(tokens[1])),
        (int.parse(tokens[0])), (int.parse(hour[0])), (int.parse(hour[1])));

    if (now.difference(date).inDays < 1) {
      my_time = "azi";
    } else {
      my_time = "acum ";
      my_time += now.difference(date).inDays.toString();
      if (now.difference(date).inDays == 1) {
        my_time += " zi";
      } else {
        my_time += " zile";
      }
    }

    return my_time;
  }

  Widget buildList() {
    var globalData = GlobalData();
    return ListView(
      children: <Widget>[
        QuestionCard(widget.question),
        Card(
          color: Colors.amber.shade200,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Form(
                  key: formKey,
                  child: Container(
                      child: Column(
                        children: <Widget>[
                          new Theme(
                              data: new ThemeData(
                                primaryColor: Colors.black,
                              ),
                              child: TextFormField(
                                controller: myController,
                                decoration: new InputDecoration(
                                    labelText: "Răspunde la întrebare",
                                    fillColor: Colors.white,
                                    border: new OutlineInputBorder(
                                      borderRadius: new BorderRadius.circular(1.0),
                                      borderSide: const BorderSide(
                                          color: Colors.black, width: 0.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            new BorderRadius.circular(1.0),
                                        borderSide: BorderSide(color: Colors.grey)),
                                    labelStyle: TextStyle(fontFamily: 'Raleway')
                                    //fillColor: Colors.green
                                    ),
                                validator: (val) {
                                  if (val.length < 10) {
                                    return "Răspunsul trebuie să fie de cel puțin 10 caractere";
                                  } else {
                                    return null;
                                  }
                                },
                                style: new TextStyle(
                                  fontFamily: "Poppins",
                                ),
                                onChanged: (text) {
                                  setState(() {
                                    if(text.length > 0) {
                                      isValid = true;
                                    } else {
                                      isValid = false;
                                    }
                                  });
                                },
                              )),
                          sendButton()
                        ],
                      )),
                )
              ],
            ),
          ),
        ),
        Column(
          children: answers.map((data) => answerCard(data)).toList(),
        )
      ],
    );
  }

  Widget sendButton() {
    return isValid ? RaisedButton(
      child: Text("Trimite"),
      onPressed: () {
        if (formKey.currentState.validate()) {
          if (isValid) {
            FocusScope.of(context).unfocus();
            _storeData();
          }
        }
      },
    ) : SizedBox.shrink();
  }

  void _storeData() async {
    var globalData =GlobalData();
    var now = DateTime.now();
    String date = now.day.toString() + "/" + now.month.toString()
        + "/" + now.year.toString() + "/" + now.hour.toString() + ":" + now.minute.toString();
    String text = myController.text;
    var firestore = Firestore.instance;
    await widget.question.reference.collection("answers")
        .add({'text': text, 'author': globalData.user.author,
      'id' : answers.length + 1, 'icon' : globalData.user.icon, 'time' : date});
    myController.clear();

    await widget.question.reference.updateData({'answers' : widget.question.answersN + 1});
  }

  void _updateAnswer(DocumentSnapshot answer) async {
    answer.data["id"] = 0;
    await answer.reference.updateData({'id' : 0});
  }
}
