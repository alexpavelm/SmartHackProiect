import 'package:flutter/material.dart';
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
    return Card(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  child: widget.topicResult.categorieMaterie != ""
                      ? widget.topicResult.chapter != null
                          ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      widget.topicResult.chapter.title,
                                      style: TextStyle(
                                          fontFamily: "Raleway",
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25),
                                    ),
                                    Text(
                                      widget.topicResult.categorieMaterie,
                                      style: TextStyle(
                                          fontFamily: "Raleway",
                                          fontSize: 20, color: Colors.grey),
                                    ),
                                  ],
                                ),
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Container(
                                  height: 21,
                                  width: 84,
                                  child: RaisedButton(
                                    child: Text(
                                      widget.topicResult.materie,
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
                          )
                          : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.topicResult.categorieMaterie,
                            style: TextStyle(
                                fontFamily: "Raleway",
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Container(
                          height: 21,
                          width: 84,
                          child: RaisedButton(
                            child: Text(
                              widget.topicResult.materie,
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
                  )
                      : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.topicResult.materie,
                            style: TextStyle(
                                fontFamily: "Raleway",
                                fontWeight: FontWeight.bold,
                                fontSize: 25, color: Colors.black),
                          ),
                          Text(
                            "3 categorii",
                            style: TextStyle(
                                fontFamily: "Raleway",
                                fontSize: 20, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
