import 'package:flutter/material.dart';
import 'package:flutter_web_tab/tab_items.dart';
import 'package:flutter_web_tab/tab_widget.dart';

/// マイページ画面
class MyPage extends StatelessWidget {
  const MyPage({Key? key, required this.currentTab, required this.index})
      : super(key: key);
  final TabItem currentTab;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyPageTabWidget(
        currentTab: currentTab,
        index: index,
      ),
    );
  }
}