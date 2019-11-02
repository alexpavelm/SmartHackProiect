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
    return Column(
      children: <Widget>[
        InkWell(
          onTap: () {

          },
          child: Card(
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: widget.materie.icon,
                  title: Text(widget.materie.title, style: TextStyle(fontSize: 25)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
