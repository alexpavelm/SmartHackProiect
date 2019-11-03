import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';

class Answer {

  int id;
  final String text;
  final String author;
  final String time;
  final String icon;
  final DocumentReference reference;

  // Data taken from database about cities
  Answer.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['id'] != null),
        assert(map['text'] != null),
        assert(map['author'] != null),
        assert(map['time'] != null),

        id = map['id'],
        author = map['author'],
        time = map['time'],
        icon = map['icon'],
        text = map['text'];

  Answer.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

}