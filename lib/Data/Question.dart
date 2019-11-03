import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smarthack_project/Data/Answer.dart';

class Question {

  final int id;
  final bool isAnswered;
  final String title;
  final String text;
  final String author;
  final String keywords;
  final String materie;
  final String time;
  final String icon;
  final int answersN;
  final DocumentReference reference;
  List<Answer> answers;

  // Data taken from database about cities
  Question.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['id'] != null),
        assert(map['title'] != null),
        assert(map['text'] != null),
        assert(map['author'] != null),
        assert(map['keywords'] != null),
        assert(map['isAnswered'] != null),
        assert(map['materie'] != null),
        assert(map['time'] != null),
        assert(map['icon'] != null),
        assert(map['answers'] != null),


        id = map['id'],
        answersN = map['answers'],
        time = map['time'],
        title = map['title'],
        text = map['text'],
        author = map['author'],
        icon = map['icon'],
        isAnswered = map['isAnswered'],
        materie = map['materie'],
        keywords = map['keywords'],
        answers = null;

  Question.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

}