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
    String username = checkUsername(widget.question.author);
    String answers = "0";
    String time = widget.question.time;
    String duration = getTime(time);

    return Padding(
      padding: const EdgeInsets.only(left: 1, right: 1, bottom: 1),
      child: Card(
        color: Color(0xFFFFFFFF),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: 320,
                      child: Text(
                        title,
                        style: TextStyle(
                          fontFamily: "Raleway",
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: new Icon(
                        Icons.help,
                        color: Colors.indigoAccent
                      ),
                    ),
                  ],
                ),
                Container(
                  color: Colors.white,
                  height: 5,
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
                      username + " acum " + duration,
                      style: TextStyle(
                        fontFamily: "Raleway",
                        fontSize: 12,
                        color: Colors.grey,
                      )
                    ),
                    Text(
                      answers + " raspunsuri",
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

  String checkUsername(String value) {
    if ((value == "") || (value == null)) {
      return "anonim";
    } else {
      return value;
    }
  }

}
