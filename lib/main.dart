import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'BottomNavBar.dart';
import 'GlobalData.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setEnabledSystemUIOverlays([]);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    getData();
    return MaterialApp(
      title: 'SmartHack Proiect ',
      theme: new ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.white,
          accentColor: Colors.lightBlue),
      home: BottomNavBar(),
    );
  }
}

getData() async {
  var globalData = GlobalData();
  if(globalData.questions == null) {
    var data = await Firestore.instance.collection("questions").getDocuments();
    globalData.questions = data.documents;
    var data2 = await Firestore.instance.collection("data/matematica/matrici").getDocuments();
    globalData.matrici = data2.documents;

  }
}
