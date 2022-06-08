// ignore_for_file: unused_import, non_constant_identifier_names

import 'package:get/get.dart';
import 'package:quickorder/app.dart';
import 'package:quickorder/logic/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../logic/helpers/app_manager.dart';
import '../../ui/utils/reusable_widgets.dart';

class PrimaryControler extends GetxController {
  var isLoading = true.obs;
  var restaurents = [].obs;
  var search_results = [].obs;
  var hasOrderHistory = false.obs;
  var historyItems = [].obs;

  AppData? _appData;
  @override
  void onInit() {
    super.onInit();
    getData().whenComplete(() {
      loadLists();
      checkIFLatestOrderAvailable();
    });
  }

  Future<void> getData() async {
    _appData = await loadShops();
  }

  void loadLists() {
    restaurents.assignAll(_appData!.shops!);
  }

  //
  void search(String q) async {
    search_results.clear();
    for (Shop s in _appData!.shops!) {
      if (s.shopName!.toUpperCase().contains(q) ||
          s.shopLocation!.toUpperCase().contains(q)) {
        search_results.add(s);
      }
      for (Item i in s.items!) {
        if (i.itemName!.toUpperCase().contains(q) ||
            i.itemDescription!.toUpperCase().contains(q)) {
          search_results.add(i);
          if (!search_results.contains(s)) search_results.add(s);
        }
      }
    }
  }

  void saveCokies(String shopID, String itemID) async {
    String orderID = shopID + "/#*" + itemID;
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('latestOrder', orderID);
  }

  checkIFLatestOrderAvailable() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.getString('latestOrder') != null) {
      var ids = pref.getString('latestOrder')!.split('/#*');
      String shopID = ids[0];
      String itemID = ids[1];
      historyItems.add(getItem(itemID, getShop(shopID)!));
      hasOrderHistory(true);
    }
  }

  Shop? getShop(String shopID) {
    Shop? shop;
    for (Shop s in _appData!.shops!) {
      if (s.id == shopID) {
        shop = s;
      }
    }
    return shop;
  }

  Item? getItem(String itemID, Shop shop) {
    Item? item;
    for (Item i in shop.items!) {
      if (i.id == itemID) {
        item = i;
      }
    }
    return item;
  }
}
