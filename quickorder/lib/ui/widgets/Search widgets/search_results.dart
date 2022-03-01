import 'package:flutter/material.dart';
import 'package:quickorder/ui/utils/reusable_constants.dart';
import 'package:quickorder/ui/widgets/Search%20widgets/food_results_tab.dart';
import 'package:quickorder/ui/widgets/Search%20widgets/restaurents_results_tab.dart';

import 'all_search_results_tab.dart';

class SearchResults extends StatefulWidget {
  const SearchResults({Key? key}) : super(key: key);

  @override
  _SearchResultsState createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: TabBar(
              isScrollable: false,
              labelColor: color3,
              controller: _tabController,
              indicatorColor: color1,
              tabs: const [
                Tab(
                  text: 'All',
                ),
                Tab(
                  text: 'Restaurents',
                ),
                Tab(
                  text: 'Food',
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                AllResults(),
                RestaurentResults(),
                FoodResults(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
