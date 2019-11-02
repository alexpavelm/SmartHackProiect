import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smarthack_project/Data/Chapter.dart';
import 'package:smarthack_project/Data/Question.dart';

import '../GlobalData.dart';
import 'QuestionCard.dart';

class QuestionsWidget extends StatefulWidget {
  @override
  _QuestionsWidgetState createState() => _QuestionsWidgetState();
}

class _QuestionsWidgetState extends State<QuestionsWidget> {
  var globalData = GlobalData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Întrebări",
              style: TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 28)),
        ),
        backgroundColor: Colors.blue.shade300,
        elevation: 0,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: getList(),
        ),
      ),
    );
  }

  Widget getList() {
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
        return buildList();
      },
    );
  }

  Widget buildList() {
    return ListView(
      children: globalData.questions.map((data) => QuestionCard(Question.fromSnapshot(data))).toList(),
    );
  }
}
