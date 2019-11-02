import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';

class Chapter {

  final int id;
  final String text;
  final String title;
  final String keywords;
  final DocumentReference reference;

  // Data taken from database about cities
  Chapter.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['id'] != null),
        assert(map['text'] != null),
        assert(map['keywords'] != null),
        assert(map['title'] != null),

        id = map['id'],
        text = map['text'],
        title = map['title'],
        keywords = map['keywords'];

  Chapter.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

}