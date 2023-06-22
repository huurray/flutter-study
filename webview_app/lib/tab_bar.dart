import 'package:flutter/material.dart';

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({
    super.key,
    required this.tabs,
    required this.tabViews,
    this.onChangedIndex,
  });

  final List<String> tabs;
  final List<Widget> tabViews;
  final void Function(int index)? onChangedIndex;

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget>
    with TickerProviderStateMixin {
  TabController? _tabController;

  void onChangedIndex() {
    if (_tabController == null || widget.onChangedIndex == null) return;
    if (_tabController!.indexIsChanging) return;
    widget.onChangedIndex!(_tabController!.index);
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget.tabs.length, vsync: this);
    _tabController?.addListener(onChangedIndex);
  }

  @override
  void dispose() {
    _tabController?.removeListener(onChangedIndex);
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          labelStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
          unselectedLabelColor: Colors.black38,
          labelColor: Colors.black,
          indicatorColor: Colors.amber,
          dividerColor: Colors.red,
          tabs: widget.tabs
              .map(
                (tab) => Tab(
                  text: tab,
                  height: 48,
                ),
              )
              .toList(),
        ),
        Expanded(
          child: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: widget.tabViews,
          ),
        ),
      ],
    );
  }
}
