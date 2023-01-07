import 'package:flutter/material.dart';
import 'package:flutter_web_tab/tab_items.dart';
import 'package:go_router/go_router.dart';

/// MyPageの表示情報を切り替えるタブ。
class MyPageTabWidget extends StatefulWidget {
  const MyPageTabWidget({Key? key, required this.currentTab, required this.index})
      : super(key: key);
  final TabItem currentTab;
  final int index;

  @override
  _MyPageTabWidgetState createState() => _MyPageTabWidgetState();
}

class _MyPageTabWidgetState extends State<MyPageTabWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: MyPageTabs.data.length,
      vsync: this,
      initialIndex: widget.index,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(MyPageTabWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    _tabController.index = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Center(
          child: TabBar(
            controller: _tabController,
            indicatorColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey.withOpacity(0.6),
            isScrollable: true,
            onTap: (int index) {
              _onTap(context, index);
            },
            tabs: [for (TabItem t in MyPageTabs.data) t.tab],
          ),
        ),
        // tabのボディ
        IndexedStack(
          alignment: Alignment.center,
          index: widget.index,
          children: [
            for (final t in MyPageTabs.data)
              Visibility(
                  child: t.view,
                  visible: widget.index ==
                      MyPageTabs.data
                          .indexWhere((tab) => tab.tabId == t.tabId)),
          ],
        )
      ],
    );
  }

  void _onTap(BuildContext context, int index) {
    context.go('/myPage/${MyPageTabs.data[index].tabId}');
  }
}
