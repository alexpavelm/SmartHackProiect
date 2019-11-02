import 'package:flutter/cupertino.dart';

class QuestionsWidget extends StatefulWidget {
  @override
  _QuestionsWidgetState createState() => _QuestionsWidgetState();
}

class _QuestionsWidgetState extends State<QuestionsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Questions Widget"),
      ),
    );
  }
}
