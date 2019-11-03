import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smarthack_project/Data/Chapter.dart';

import 'ChapterWidget.dart';

class TopicWidget extends StatefulWidget {
  Chapter chapter;
  String materie;
  TopicWidget(this.chapter, this.materie);

  @override
  _TopicWidgetState createState() => _TopicWidgetState();
}

class _TopicWidgetState extends State<TopicWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChapterWidget(widget.chapter, widget.materie)),
          );
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(widget.chapter.title,
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: "Poppins",
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
