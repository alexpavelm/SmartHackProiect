import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:smarthack_project/Data/Chapter.dart';

import '../GlobalData.dart';

class ChapterWidget extends StatefulWidget {
  Chapter chapter;
  String materie;

  ChapterWidget(this.chapter, this.materie);

  @override
  _ChapterWidgetState createState() => _ChapterWidgetState();
}

class _ChapterWidgetState extends State<ChapterWidget> {
  var globalData = GlobalData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.chapter.title,
            style: TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 28)),
        backgroundColor: Colors.blue.shade300,
        elevation: 0,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: getData(),
        ),
      ),
    );
  }

  Widget getData() {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection("data/" + widget.materie.toLowerCase() + "/" + widget.chapter.title.toLowerCase()).snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Center(child: CircularProgressIndicator(),);
        globalData.chapters[widget.chapter.title] = snapshot.data.documents;
        globalData.chapters[widget.chapter.title].sort((a, b) =>
            Chapter
                .fromSnapshot(a)
                .id
                .compareTo(Chapter
                .fromSnapshot(b)
                .id));
        if (globalData.chapters[widget.chapter.title] == null) {
          globalData.chapters[widget.chapter.title] = new List();
        }
        return buildList();
      },
    );
  }

  Widget buildList() {
    return ListView(
      children: <Widget>[
        Column(
          children: globalData.chapters[widget.chapter.title].map((data) => cuprinsWidget(data)).toList(),
        ),
        htmlTextWidget(widget.chapter.text),
        chapterControlWidget()
      ],
    );
  }

  Widget cuprinsWidget(DocumentSnapshot data) {
    var chapter = Chapter.fromSnapshot(data);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          InkWell(
            child: Card(
                child: Container(
                  width: 200,
                  child: Center(
                    child: Padding(
                      padding:
                      const EdgeInsets.only(left: 8, right: 8, top: 5, bottom: 5),
                      child: Text(
                        chapter.title,
                        style: TextStyle(fontWeight: globalData.currentChapter == chapter.id
                            ? FontWeight.bold : FontWeight.normal,
                            fontSize: globalData.currentChapter == chapter.id ? 16 : 14,
                            color: globalData.currentChapter == chapter.id ? Colors.black : Colors.grey),
                      ),
                    ),
                  ),
                )),
            onTap: () {
              setState(() {
                globalData.currentChapter = chapter.id;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget htmlTextWidget(String data) {
    return Container(
      child: Center(
        child: Card(
          child: Html(
            data: data,
            //Optional parameters:
            padding: EdgeInsets.all(8.0),
            backgroundColor: Colors.white70,
            defaultTextStyle: TextStyle(fontFamily: 'serif'),
            linkStyle: const TextStyle(
              color: Colors.redAccent,
            ),
            onLinkTap: (url) {
              globalData.launchURL(url);
            },
          ),
        ),
      ),
    );
  }

  Widget chapterControlWidget() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            RaisedButton(
              child: Text("Inapoi"),
              textColor: Colors.black.withOpacity(0.6),
              color: globalData.currentChapter == 1 ? Colors.grey : Colors.blue.shade300,
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
              ),
              onPressed: () {
                setState(() {
                  if(globalData.currentChapter > 1) {
                    globalData.currentChapter--;
                  }
                });
              },
            ),
            RaisedButton(
              child: Icon(Icons.home),
              textColor: Colors.black.withOpacity(0.6),
              color: Colors.blue.shade300,
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
              ),
              onPressed: () {
                setState(() {
                  globalData.currentChapter = 1;
                });
              },
            ),
            RaisedButton(
              child: Text("Inainte"),
              textColor: Colors.black.withOpacity(0.6),
              color: globalData.currentChapter == globalData.chapters[widget.chapter.title].length ? Colors.grey : Colors.blue.shade300,
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
              ),
              onPressed: () {
                setState(() {
                  if(globalData.currentChapter < globalData.chapters.length) {
                    globalData.currentChapter++;
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
