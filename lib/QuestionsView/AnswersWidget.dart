import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smarthack_project/Data/Question.dart';
import 'package:smarthack_project/QuestionsView/AnswerCard.dart';
import 'package:smarthack_project/QuestionsView/QuestionCard.dart';

class AnswersWidget extends StatelessWidget {
  Question question;

  AnswersWidget(this.question);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.indigoAccent,
        title: Text(""),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      body: Center(
        child: Hero(
          tag: question.id,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                QuestionCard(question),
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
                AnswerCard(),
                AnswerCard(),

              ],
            )
        ),
      ),
    );
  }

}