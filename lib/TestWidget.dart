import 'package:flutter/cupertino.dart';

import 'Data/Chapter.dart';
import 'GlobalData.dart';
import 'MainView/ChapterWidget.dart';

class TestWidget extends StatefulWidget {
  @override
  _TestWidgetState createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  var globalData = GlobalData();
  Widget build(BuildContext context) {
    return Container(
      child: ChapterWidget(Chapter.fromSnapshot(globalData.chapters["matrici"][0]), "matematica"),
    );
  }
}
