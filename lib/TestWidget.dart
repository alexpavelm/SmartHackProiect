import 'package:flutter/cupertino.dart';

class MoreWidget extends StatefulWidget {
  @override
  _MoreWidgetState createState() => _MoreWidgetState();
}

class _MoreWidgetState extends State<MoreWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("More Page"),
      ),
    );
  }
}
