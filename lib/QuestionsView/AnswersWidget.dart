import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smarthack_project/Data/Answer.dart';
import 'package:smarthack_project/Data/Question.dart';
import 'package:smarthack_project/QuestionsView/QuestionCard.dart';

class AnswersWidget extends StatefulWidget {
  Question question;

  AnswersWidget(this.question);

  @override
  _AnswersWidgetState createState() => _AnswersWidgetState();
}

class _AnswersWidgetState extends State<AnswersWidget> {
  List<DocumentSnapshot> answers;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("",
            style: TextStyle(
                color: Colors.black.withOpacity(0.6),
                fontSize: 28, fontFamily: 'Raleway'
            )),
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
        if (!snapshot.hasData) return Center(child: CircularProgressIndicator(),);
        answers = snapshot.data.documents;
        answers.sort((a, b) =>
            Answer
                .fromSnapshot(a)
                .id
                .compareTo(Answer
                .fromSnapshot(b)
                .id));
        if (answers == null) {
          answers = new List();
        }
        return buildList();
      },
    );
  }

  Widget answerCard(DocumentSnapshot data) {
    Answer answer = Answer.fromSnapshot(data);
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      answer.id == 0 ? Text("Răspuns ales", style: TextStyle(fontSize: 10, color: Colors.grey),) : SizedBox.shrink(),
                      Container(
                        child: Text(
                          text,
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.bold,
                              fontSize: 15
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Image.network(
                        "https://qwr.ro/J7Rw",
                        scale: 8,
                      ),
                      Text(
                          author,
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 10
                          )
                      )
                    ],
                  ),

                ],
              ),
              Row(
                children: <Widget>[
                  Text(
                    "acum " + duration,
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
        ),
      ),
    );
  }

  String getTime(String time) {
    List<String> tokens = time.split("/");
    List<String> hour = tokens[3].split(":");
    String my_time = "";

    var now = DateTime.now();
    var date = DateTime(
        (int.parse(tokens[2])),
        (int.parse(tokens[1])),
        (int.parse(tokens[0])),
        (int.parse(hour[0])),
        (int.parse(hour[1])));

    if (now.difference(date).inDays < 1) {
      my_time += now.difference(date).inHours.toString();
      my_time += " ore";
    } else {
      my_time += now.difference(date).inDays.toString();
      my_time += " zile";
    }

    return my_time;
  }

  Widget buildList() {
    return ListView(
      children: <Widget>[
        QuestionCard(widget.question),
        Card(
          color: Colors.amber,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                    "Propune si tu un raspuns!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
                TextField(),
                ButtonBar(
                  children: <Widget>[
                  ],
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
}