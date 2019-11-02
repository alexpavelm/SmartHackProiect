import 'package:flutter/material.dart';
import 'package:smarthack_project/Data/Chapter.dart';
import 'package:smarthack_project/Data/TopicResult.dart';
import 'package:smarthack_project/GlobalData.dart';

class TopicResultWidget extends StatefulWidget {
  TopicResult topicResult;

  TopicResultWidget(this.topicResult);

  @override
  _TopicResultWidgetState createState() => _TopicResultWidgetState();
}

class _TopicResultWidgetState extends State<TopicResultWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, right: 4, top: 4),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: widget.topicResult.categorieMaterie != null
                    ? widget.topicResult.chapter != null
                        ? Text(
                            widget.topicResult.chapter.title + ": ",
                            style: TextStyle(
                                fontFamily: "Raleway",
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          )
                        : Text(
                            widget.topicResult.categorieMaterie + ": ",
                            style: TextStyle(
                                fontFamily: "Raleway",
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          )
                    : Text(
                        widget.topicResult.materie + ": ",
                        style: TextStyle(
                            fontFamily: "Raleway",
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
              ),
              Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    GlobalData().capitole[0] + ".",
                    style: TextStyle(
                        fontFamily: "Raleway",
                        fontSize: 15),
                  ),
                  Text(
                    GlobalData().capitole[1] + ".",
                    style: TextStyle(
                        fontFamily: "Raleway",
                        fontSize: 15),
                  ),
                  Text(
                    GlobalData().capitole[2] + ".",
                    style: TextStyle(
                        fontFamily: "Raleway",
                        fontSize: 15),
                  ),
                  Text(
                      "Si inca " +
                          (GlobalData().capitole.length - 3).toString() +
                          " capitole."
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
