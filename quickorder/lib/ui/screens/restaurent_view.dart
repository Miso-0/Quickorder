// ignore_for_file: unused_local_variable, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:quickorder/get/controllers/primary_controller.dart';
import 'package:quickorder/logic/models/models.dart';
import 'package:quickorder/ui/utils/reusable_constants.dart';

import '../utils/reusable_widgets.dart';

class RestaurentView extends StatefulWidget {
  const RestaurentView({Key? key}) : super(key: key);

  @override
  _RestaurentViewState createState() => _RestaurentViewState();
}

class _RestaurentViewState extends State<RestaurentView> {
  final ScrollController _scrollController = ScrollController();

  bool btnsVisible = true;

  @override
  void initState() {
    initController();
    super.initState();
  }

  void initController() {
    _scrollController.addListener(
      () {
        if (_scrollController.position.atEdge) {
          bool isTop = _scrollController.position.pixels == 0;
          if (isTop) {
            setState(() {
              btnsVisible = true;
            });
          } else {
            btnsVisible = false;
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as Map;
    String shopID = args["shopID"];
    String itemID = args["itemID"];
    var _pc = Get.find<PrimaryControler>();
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(
          body: CustomScrollView(
            controller: _scrollController,
            slivers: [
              appBarRestaurents(shopID, _pc),
              getSlivers(shopID, itemID, _pc),
            ],
          ),
        ),
      ),
    );
  }

  SliverAppBar appBarRestaurents(String shopID, PrimaryControler pc) {
    return SliverAppBar(
      backgroundColor: color2,
      expandedHeight: MediaQuery.of(context).size.height * 0.25,
      pinned: true,
      elevation: 0,
      leading: IconButton(
        color: color2,
        onPressed: () => Get.back(),
        icon: const Icon(
          Icons.arrow_back_ios,
          color: color1,
          size: 23,
        ),
      ),
      actions: [
        Visibility(
          visible: !btnsVisible,
          child: GestureDetector(
            onTap: () => print('tapped'),
            child: Container(
              width: 30,
              height: 30,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: color2,
              ),
              child: const Center(
                child: Icon(
                  Icons.menu,
                  color: color1,
                  size: 19,
                ),
              ),
            ),
          ),
        ),
        Visibility(
          visible: btnsVisible,
          child: GestureDetector(
            onTap: () => print('tapped'),
            child: Container(
              width: 30,
              height: 30,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: color2,
              ),
              child: const Center(
                child: Icon(
                  Icons.favorite_outline,
                  color: color1,
                  size: 19,
                ),
              ),
            ),
          ),
        ),
        Visibility(
          visible: btnsVisible,
          child: const SizedBox(
            width: 20,
          ),
        ),
        Visibility(
          visible: btnsVisible,
          child: GestureDetector(
            onTap: () => print('tapped'),
            child: Container(
              width: 30,
              height: 30,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: color2,
              ),
              child: const Center(
                child: Icon(
                  MdiIcons.share,
                  color: color1,
                  size: 19,
                ),
              ),
            ),
          ),
        ),
        Visibility(
          visible: btnsVisible,
          child: const SizedBox(
            width: 20,
          ),
        ),
        Visibility(
          visible: btnsVisible,
          child: GestureDetector(
            onTap: () => print('tapped'),
            child: Container(
              width: 30,
              height: 30,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: color2,
              ),
              child: const Center(
                child: Icon(
                  Icons.search,
                  color: color1,
                  size: 19,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Image(
          image: NetworkImage(
            "${pc.getShop(shopID)!.adheaderImgUrl}",
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget getSlivers(String shopID, String itemID, PrimaryControler pc) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Text(
                    '${pc.getShop(shopID)!.shopName}, ${pc.getShop(shopID)!.shopLocation}',
                    style: GoogleFonts.openSans(
                      fontWeight: FontWeight.bold,
                      fontSize: 27,
                      color: color3,
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            child: Container(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.grade,
                            size: 17,
                            color: color4,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "5.5 (500 Ratings)",
                            style: GoogleFonts.openSans(
                              fontWeight: FontWeight.w700,
                              fontSize: 13,
                              color: color4,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Open until ${pc.getShop(shopID)!.closeTime}",
                            style: GoogleFonts.openSans(
                              fontWeight: FontWeight.normal,
                              fontSize: 13,
                              color: color4,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Tap to view hours, address and more",
                            style: GoogleFonts.openSans(
                              fontWeight: FontWeight.normal,
                              fontSize: 13,
                              color: color4,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: color4,
                    size: 17,
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: itemID == "none" ? false : true,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 3),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Searched",
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w600,
                          fontSize: 19,
                          color: color3,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: itemID == "none"
                      ? const SizedBox()
                      : GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      "${pc.getItem(itemID, pc.getShop(shopID)!)!.imageUrl}"),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${pc.getItem(itemID, pc.getShop(shopID)!)!.itemName}",
                                      style: GoogleFonts.openSans(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 17,
                                        color: color4,
                                      ),
                                    ),
                                    Text(
                                      "R${pc.getItem(itemID, pc.getShop(shopID)!)!.itemPrice}",
                                      style: GoogleFonts.openSans(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13,
                                        color: color4,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                ),
              ],
            ),
          ),
          Visibility(
              visible: itemID == "none" ? false : true, child: const Divider()),
          Visibility(
            visible: pc.hasOrderHistory.value,
            child: getOrderAgain(pc.historyItems),
          ),
          Visibility(visible: pc.hasOrderHistory.value, child: const Divider()),
          Visibility(
            visible: true,
            child: getMenu(pc.getShop(shopID)!.items!),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
