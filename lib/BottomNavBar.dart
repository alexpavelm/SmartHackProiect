import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'MainView/MainWidget.dart';
import 'MoreView/MoreWidget.dart';
import 'QuestionsView/QuestionsWidget.dart';

class BottomNavBar extends StatefulWidget {
  @override
  State<BottomNavBar> createState() {
    return BottomNavBarState();
  }
}

class BottomNavBarState extends State<BottomNavBar> {
  final List<Widget> _children = [
    MainWidget(),
    QuestionsWidget(),
    MoreWidget()
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: new Scaffold(
          body: TabBarView(children: _children), // new
          bottomNavigationBar: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.list),
              ),
              Tab(
                icon: Icon(Icons.question_answer),
              ),
              Tab(
                icon: Icon(Icons.info_outline),
              )
            ],
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.blue,
          ),
        ),
      ),
    );
  }
}
