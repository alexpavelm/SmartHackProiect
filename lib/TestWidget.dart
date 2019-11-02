import 'package:flutter/cupertino.dart';

import 'MainView/ChapterWidget.dart';

class TestWidget extends StatefulWidget {
  @override
  _TestWidgetState createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  Widget build(BuildContext context) {
    return Container(
      child: ChapterWidget(),
    );
  }
}
