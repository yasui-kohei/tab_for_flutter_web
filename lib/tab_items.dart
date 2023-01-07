import 'package:flutter/material.dart';
import 'package:flutter_web_tab/tab.dart';

/// Tabの文字とクリックされた時表示するviewを格納するデータクラス
class TabItem {
  const TabItem({required this.tabId, required this.tab, required this.view});

  /// タブ固有のID
  final String tabId;

  /// 各タブのウィジェット
  final Tab tab;

  /// 各タブで表示する画面ページ
  final Widget view;
}

/// MyPageのタブのリストデータ用クラス
class MyPageTabs {
  static final data = [
    // tab1のタブ情報
    const TabItem(
        tabId: "tab1",
        tab: Tab(
          child: Text(
            'タブ1',
          ),
        ),
        view: Tab1Page()),
    // tab2のタブ情報
    const TabItem(
      tabId: "tab2",
      tab: Tab(
        child: Text(
          'タブ2',
        ),
      ),
      view: Tab2Page(),
    ),
    // tab3のタブ情報
    const TabItem(
      tabId: "tab3",
      tab: Tab(
        child: Text(
          'タブ3',
        ),
      ),
      view: Tab3Page(),
    ),
  ];
  static TabItem family(String tabId) => data.tabItem(tabId);
}
extension on List<TabItem> {
  TabItem tabItem(String tabId) => singleWhere(
        (t) => t.tabId == tabId,
    orElse: () => throw Exception('unknown family $tabId'),
  );
}