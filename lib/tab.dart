import 'package:flutter/material.dart';

///[/myPage/tab1]のパスで表示する画面
class Tab1Page extends StatelessWidget {
  const Tab1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text(
      '1',
      style: TextStyle(
        fontSize: 40,
      ),
    ));
  }
}

///[/myPage/tab2]のパスで表示する画面
class Tab2Page extends StatelessWidget {
  const Tab2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text(
      '2',
      style: TextStyle(
        fontSize: 40,
      ),
    ));
  }
}

///[/myPage/tab3]のパスで表示する画面
class Tab3Page extends StatelessWidget {
  const Tab3Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text(
      '3',
      style: TextStyle(
        fontSize: 40,
      ),
    ));
  }
}
