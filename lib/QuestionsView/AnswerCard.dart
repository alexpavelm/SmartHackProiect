import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smarthack_project/Data/Answer.dart';
import 'package:smarthack_project/QuestionsView/QuestionCard.dart';

class AnswerCard extends StatefulWidget{
//  Answer answer;

//  AnswerCard(this.answer);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AnswerCardState();
  }
}

class AnswerCardState extends State<AnswerCard> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
//    Answer answer = widget.answer;
    final int id = 1;
    final String text = "hello ai incercat sa citesti pe wikipedia? sagdhgas sfdasjfh ffahsf sjasfj";
    final String author = "mara92";
    String time = "2/11/2019/20:30";
    String duration = getTime(time);

    return Card(
      color: Color(0xFFFFE6CC),
      child: Container(
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
                      child: Text(
                        text,
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Image.network(
                        "https://qwr.ro/J7Rw",
                        scale: 8,
                      ),
                      Text(
                        author,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 10
                        )
                      )
                    ],
                  ),

                ],
              ),
              Row(
                children: <Widget>[
                  Text(
                    "acum " + duration,
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
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
    var date = DateTime(
        (int.parse(tokens[2])),
        (int.parse(tokens[1])),
        (int.parse(tokens[0])),
        (int.parse(hour[0])),
        (int.parse(hour[1])));

    if (now.difference(date).inDays < 1) {
      my_time += now.difference(date).inHours.toString();
      my_time += " ore";
    } else {
      my_time += now.difference(date).inDays.toString();
      my_time += " zile";
    }

    return my_time;
  }
}