import 'package:flutter/material.dart';
import 'package:flutter_web_tab/home_page.dart';
import 'package:flutter_web_tab/my_page.dart';
import 'package:flutter_web_tab/tab_items.dart';
import 'package:go_router/go_router.dart';

/// 画面遷移の情報を定義する
final router = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      path: "/",
      pageBuilder: (context, state) {
        return MaterialPage(
        key: state.pageKey,
        child: const HomePage(),
      );}
    ),

    ///MyPageのタブに表示される情報の切り替えを行うためのGoRouteの設定
    //[/myPage/1],[/myPage/2],[/myPage/3]のパスに切り替える。
    //1,2,3はmyPageIdを示す。
    GoRoute(
        path: "/myPage/:myPageId",
        pageBuilder: (context, state) {
          final myPageId = state.params['myPageId'];
          final currentTab =
              MyPageTabs.data.firstWhere((tab) => tab.tabId == myPageId);
          final index =
              MyPageTabs.data.indexWhere((t) => t.tabId == currentTab.tabId);
          return MaterialPage(
            key: state.pageKey,
            child: MyPage(
              currentTab: currentTab,
              index: index,
            ),
          );
        }),
  ],
    //遷移ページがないなどのエラーが発生した時に、このページに行く
    errorPageBuilder: (context, state) => MaterialPage(
      key: state.pageKey,
      child: Scaffold(
        body: Center(
          child: Text(state.error.toString()),
        ),
      ),
    )
);
