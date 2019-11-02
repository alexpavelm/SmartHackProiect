import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smarthack_project/Data/Question.dart';

class QuestionCard extends StatefulWidget {
  Question question;

  QuestionCard(this.question);

  @override
  State<StatefulWidget> createState() {
    return QuestionCardState();
  }
}

class QuestionCardState extends State<QuestionCard> {
  @override
  Widget build(BuildContext context) {
    String title = widget.question.title;
    String text = widget.question.text;
    String username = widget.question.author;
    String answers = widget.question.answers.length.toString();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Color(0xFFFFFFFF),
        child: Container(
          height: 120,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: "Raleway",
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  )
                ),
                Container(
                  color: Colors.white,
                  height: 10,
                ),
                Text(
                    text,
                    style: TextStyle(
                      fontFamily: "Raleway",
                      fontSize: 12,
                    )
                ),
                Container(
                  color: Colors.white,
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      "Intrebare pusa de: " + username,
                      style: TextStyle(
                        fontFamily: "Raleway",
                        fontSize: 12,
                        color: Colors.grey,
                      )
                    ),
                    Text(
                      answers,
                        style: TextStyle(
                          fontFamily: "Raleway",
                          fontSize: 12,
                          color: Colors.grey,
                        )
                    )
                  ],
                ),
              ],
            ),
          ),
        )
//
      ),
    );
  }

}