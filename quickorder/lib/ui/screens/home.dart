import 'package:flutter/material.dart';
import 'package:quickorder/ui/tabs/account_tab.dart';
import 'package:quickorder/ui/tabs/cart_tab.dart';
import 'package:quickorder/ui/tabs/favourites_tab.dart';
import 'package:quickorder/ui/tabs/home_tab.dart';
import 'package:quickorder/ui/utils/reusable_constants.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

//Helper class for change the icons of the tabs when tapped
class TabIcon {
  Icon icon1;
  Icon icon2;
  bool isSelected;

  TabIcon({required this.icon1, required this.icon2, required this.isSelected});
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    setState(() {});
    super.initState();
  }

  var tabIcons = [
    TabIcon(
      icon1: const Icon(Icons.dashboard),
      icon2: const Icon(
        Icons.dashboard_outlined,
      ),
      isSelected: true,
    ),
    TabIcon(
      icon1: const Icon(Icons.favorite),
      icon2: const Icon(
        Icons.favorite_outline,
      ),
      isSelected: false,
    ),
    TabIcon(
      icon1: const Icon(Icons.shopping_cart),
      icon2: const Icon(
        Icons.shopping_cart_outlined,
      ),
      isSelected: false,
    ),
    TabIcon(
      icon1: const Icon(Icons.person),
      icon2: const Icon(
        Icons.person_outline,
      ),
      isSelected: false,
    ),
  ];
  setTabIcon(int index) {
    for (TabIcon icon in tabIcons) {
      icon.isSelected = false;
    }

    setState(() {
      tabIcons[index].isSelected = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: TabBarView(
            controller: tabController,
            children: [
              const HomeTab(),
              const FavouritesTab(),
              const CartTab(),
              AccountTab(
                homeTabController: tabController,
              ),
            ],
          ),
        ),
        bottomNavigationBar: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: TabBar(
            controller: tabController,
            labelColor: color1,
            padding: EdgeInsets.zero,
            onTap: (index) {
              setTabIcon(index);
            },
            unselectedLabelColor: color4,
            indicatorColor: color1,
            tabs: [
              Tab(
                icon: tabIcons[0].isSelected
                    ? tabIcons[0].icon1
                    : tabIcons[0].icon2,
                text: 'Home',
              ),
              Tab(
                icon: tabIcons[1].isSelected
                    ? tabIcons[1].icon1
                    : tabIcons[1].icon2,
                text: 'Favourites',
              ),
              Tab(
                icon: tabIcons[2].isSelected
                    ? tabIcons[2].icon1
                    : tabIcons[2].icon2,
                text: 'Cart',
              ),
              Tab(
                icon: tabIcons[3].isSelected
                    ? tabIcons[3].icon1
                    : tabIcons[3].icon2,
                text: 'Account',
              )
            ],
          ),
        ),
      ),
    );
  }
}
