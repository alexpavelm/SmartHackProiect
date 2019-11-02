import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smarthack_project/Data/Question.dart';
import 'package:smarthack_project/Data/SearchResult.dart';
import 'package:smarthack_project/QuestionsView/QuestionCard.dart';

class SearchResultWidget extends StatefulWidget {
  SearchResult searchResult;

  SearchResultWidget(this.searchResult);

  @override
  _SearchResultWidgetState createState() => _SearchResultWidgetState();
}

class _SearchResultWidgetState extends State<SearchResultWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: ListView(
            children: <Widget>[
              Text(widget.searchResult.topicResult.materie),
              Column(
                children: widget.searchResult.questions.map((data) => QuestionCard(Question.fromSnapshot(data))).toList(),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
