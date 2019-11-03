import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smarthack_project/Data/Question.dart';
import 'package:smarthack_project/Data/SearchResult.dart';
import 'package:smarthack_project/MainView/TopicResultWidget.dart';
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
              Container(
              height: 200,
                color: Colors.blue.shade300,
                child: Center(child: Text("Rezultatele căutării", style: TextStyle(fontSize: 30, color: Colors.white),)),
          ),
              widget.searchResult.topicResult.materie == "" ? SizedBox.shrink() : TopicResultWidget(widget.searchResult.topicResult),
              Container(
                height: 50,
                child: Center(child: Text("Întrebări relevante:", style: TextStyle(fontSize: 20, color: Colors.grey),)),
              ),
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
