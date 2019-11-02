import 'package:flutter/cupertino.dart';
import 'package:smarthack_project/QuestionsView/QuestionCard.dart';

class TestWidget extends StatefulWidget {
  @override
  _TestWidgetState createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: QuestionCard(),
      ),
    );
  }
}
