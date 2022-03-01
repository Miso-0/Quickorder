import 'package:flutter/material.dart';

import '../../utils/reusable_constants.dart';
import 'recent_tab.dart';
import 'top_search_tab.dart';

class SearchesView extends StatelessWidget {
  const SearchesView({
    Key? key,
    required TabController tabController,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: TabBar(
              controller: _tabController,
              isScrollable: false,
              labelColor: color3,
              indicatorColor: color1,
              tabs: const [
                Tab(
                  text: 'Top searches',
                ),
                Tab(
                  text: 'Recent searches',
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(controller: _tabController, children: const [
              TopSearch(),
              RecentSearch(),
            ]),
          )
        ],
      ),

      // backgroundColor: Colors.yellow,
    );
  }
}
