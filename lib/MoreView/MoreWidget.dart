import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestWidget extends StatefulWidget {
  @override
  _TestWidgetState createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.account_circle, size: 100),
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("USERNAME", style: TextStyle(fontSize: 25)),
                    Row(
                      children: <Widget>[
                        Text("Selected answers: 15 ", style: TextStyle(fontSize: 17)),
                        Icon(Icons.star, size: 20, color: Colors.yellow),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        ExpansionTile(
          title: Row(
            children: <Widget>[
              Icon(Icons.category, size: 30),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text('Materii urmarite', style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
          children: <Widget>[
            Text('Materii urmarite', style: TextStyle(fontSize: 20)),
          ],
        ),
      ],
    );
  }
}
