import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickorder/ui/utils/reusable_constants.dart';
import 'package:quickorder/ui/widgets/Favourites%20Widgets/food_tab.dart';
import 'package:quickorder/ui/widgets/Favourites%20Widgets/restaurents_tab.dart';

class FavouritesTab extends StatefulWidget {
  const FavouritesTab({Key? key}) : super(key: key);

  @override
  State<FavouritesTab> createState() => _FavouritesTabState();
}

class _FavouritesTabState extends State<FavouritesTab>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            'Your favourites',
            style: GoogleFonts.openSans(
              color: color3,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: TabBar(
                controller: _tabController,
                labelColor: color3,
                indicatorColor: color1,
                tabs: const [
                  Tab(
                    text: 'Food',
                  ),
                  Tab(
                    text: 'Restaurents',
                  )
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  FavFood(),
                  FavRestaurents(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
