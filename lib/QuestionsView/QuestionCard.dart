import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smarthack_project/Data/Question.dart';
import 'package:smarthack_project/QuestionsView/AnswersWidget.dart';

import '../GlobalData.dart';

class QuestionCard extends StatefulWidget {
  Question question;

  QuestionCard(this.question);

  @override
  State<StatefulWidget> createState() {
    return QuestionCardState();
  }
}

class QuestionCardState extends State<QuestionCard> {
  var globalData =GlobalData();
  @override
  Widget build(BuildContext context) {
    Question question = widget.question;
    String title = widget.question.title;
    String text = widget.question.text;
    String username = checkUsername(widget.question.author);
    String answers = widget.question.answersN.toString();
    String time = widget.question.time;
    String duration = getTime(time);

    return Padding(
      padding: const EdgeInsets.only(left: 1, right: 1, bottom: 1),
      child: InkWell(
        onTap: () {
          getNewAnswer(question);
        },
        child: Card(
          child: Row(
            children: <Widget>[
              Container(
                width: 50,
                child: Icon(
                    widget.question.isAnswered
                        ? FontAwesomeIcons.check
                        : FontAwesomeIcons.question,
                    color: widget.question.isAnswered
                        ? Colors.green
                        : Colors.orange),
              ),
              Container(
                width: 395,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              child: Text(title,
                                  style: TextStyle(
                                    fontFamily: 'Raleway',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Container(
                              height: 21,
                              width: 84,
                              child: RaisedButton(
                                child: Text(
                                  widget.question.materie,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Raleway',
                                      fontSize: 9),
                                ),
                                textColor: Colors.white,
                                color: Colors.blue.shade300,
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(15.0),
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(text,
                          style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 12,
                          )),
                      Container(
                        color: Colors.white,
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(right: 2),
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  child: CircleAvatar(
                                    radius: 20,
                                    backgroundImage: NetworkImage(
                                      widget.question.icon,
                                    ),
                                  ),
                                ),
                              ),
                              Text(username + " acum " + duration,
                                  style: TextStyle(
                                    fontFamily: 'Raleway',
                                    fontSize: 12,
                                    color: Colors.grey,
                                  )),
                            ],
                          ),
                          Text(answers + " raspunsuri",
                              style: TextStyle(
                                fontFamily: 'Raleway',
                                fontSize: 12,
                                color: Colors.grey,
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
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
    var date = DateTime((int.parse(tokens[2])), (int.parse(tokens[1])),
        (int.parse(tokens[0])), (int.parse(hour[0])), (int.parse(hour[1])));

    if (now.difference(date).inDays < 1) {
      my_time += now.difference(date).inHours.toString();
      my_time += " ore";
    } else {
      my_time += now.difference(date).inDays.toString();
      my_time += " zile";
    }

    return my_time;
  }

  String checkUsername(String value) {
    if ((value == "") || (value == null)) {
      return "anonim";
    } else {
      return value;
    }
  }

  void getNewAnswer(Question question) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => AnswersWidget(question)));
  }
}
