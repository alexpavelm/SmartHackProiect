import 'package:cloud_firestore/cloud_firestore.dart';

import 'Question.dart';
import 'TopicResult.dart';

class SearchResult {
  TopicResult topicResult;
  List<DocumentSnapshot> questions;

  SearchResult(this.topicResult, this.questions);

}