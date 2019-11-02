import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MaterieWidget extends StatefulWidget {
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
                const ListTile(
                  leading: Icon(Icons.category, size: 30),
                  title: Text('Matematica', style: TextStyle(fontSize: 25)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
