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
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  widget.topicResult.chapter.title,
                                  style: TextStyle(
                                      fontFamily: "Raleway",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                ),
                                RaisedButton(
                                  child: Text(
                                    widget.topicResult.categorieMaterie,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Raleway",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10),
                                  ),
                                  textColor: Colors.black.withOpacity(0.6),
                                  color: Colors.blue.shade300,
                                  shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(30.0),
                                  ),
                                  onPressed: () {
                                    setState(() {});
                                  },
                                ),
                                RaisedButton(
                                  child: Text(
                                    widget.topicResult.materie,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Raleway",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10),
                                  ),
                                  textColor: Colors.black.withOpacity(0.6),
                                  color: Colors.blue.shade300,
                                  shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(30.0),
                                  ),
                                  onPressed: () {
                                    setState(() {});
                                  },
                                ),
                              ],
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text(
                                  widget.topicResult.categorieMaterie,
                                  style: TextStyle(
                                      fontFamily: "Raleway",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                ),
                                RaisedButton(
                                  child: Text(
                                    widget.topicResult.materie,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Raleway",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10),
                                  ),
                                  textColor: Colors.black.withOpacity(0.6),
                                  color: Colors.blue.shade300,
                                  shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(30.0),
                                  ),
                                  onPressed: () {
                                    setState(() {});
                                  },
                                ),
                              ],
                            )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              widget.topicResult.materie,
                              style: TextStyle(
                                  fontFamily: "Raleway",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25),
                            ),
                            RaisedButton(
                              child: Text(
                                GlobalData().capitole[0],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Raleway",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10),
                              ),
                              textColor: Colors.black.withOpacity(0.6),
                              color: Colors.blue.shade300,
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0),
                              ),
                              onPressed: () {
                                setState(() {});
                              },
                            ),
                            RaisedButton(
                              child: Text(
                                GlobalData().capitole[1],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Raleway",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10),
                              ),
                              textColor: Colors.black.withOpacity(0.6),
                              color: Colors.blue.shade300,
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0),
                              ),
                              onPressed: () {
                                setState(() {});
                              },
                            ),
                            RaisedButton(
                              child: Text(
                                GlobalData().capitole[2],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Raleway",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10),
                              ),
                              textColor: Colors.black.withOpacity(0.6),
                              color: Colors.blue.shade300,
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0),
                              ),
                              onPressed: () {
                                setState(() {});
                              },
                            ),
                            Text(
                              "Si inca " +
                                  (GlobalData().capitole.length - 3)
                                      .toString() +
                                  " capitole.",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Raleway",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10),
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
