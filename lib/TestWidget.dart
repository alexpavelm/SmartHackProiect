import 'package:flutter/cupertino.dart';

class TestWidget extends StatefulWidget {
  @override
  _TestWidgetState createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Testing"),
      ),
    );
  }
}
