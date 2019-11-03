import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Data/Materie.dart';

class MaterieWidget extends StatefulWidget {
  Materie materie;

  MaterieWidget(this.materie);

  @override
  _MaterieWidgetState createState() => _MaterieWidgetState();
}

class _MaterieWidgetState extends State<MaterieWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.blue.shade300,
            height: 200,
            child: Center(child: Text(widget.materie.title, style: TextStyle(fontSize: 35, color: Colors.white),),),
          ),
          Container(
            child: Column(
              children: <Widget>[

              ],
            ),
          )
        ],
      ),
    );
  }
}
