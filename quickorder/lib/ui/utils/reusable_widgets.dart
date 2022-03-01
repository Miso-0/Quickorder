import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:quickorder/logic/models/widget_models.dart';
import 'package:quickorder/ui/utils/reusable_constants.dart';

import '../../logic/models/models.dart';

catCard(CategoryModel cat, BuildContext context) {
  var size = MediaQuery.of(context).size;
  return GestureDetector(
    child: Container(
      width: size.width * 0.28,
      margin: const EdgeInsets.fromLTRB(21, 5, 0, 10),
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          20,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 60,
              height: 60,
              child: Image(
                image: AssetImage(cat.imagePath),
              ),
            ),
            Text(
              cat.name!,
              style: GoogleFonts.openSans(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              width: 30,
              height: 30,
              decoration: const BoxDecoration(
                color: color1,
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 17,
                  color: color2,
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}

resturentCard(Shop shop, BuildContext context) {
  var size = MediaQuery.of(context).size;
  return GestureDetector(
    onTap: () => Get.toNamed('/restaurentview'),
    child: Container(
      width: size.width * 0.28,
      margin: const EdgeInsets.fromLTRB(21, 5, 0, 10),
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          20,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 60,
              height: 50,
              child: Image(
                image: NetworkImage(shop.imageUrl!),
              ),
            ),
            Text(
              shop.shopName!,
              style: GoogleFonts.openSans(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              width: 30,
              height: 30,
              decoration: const BoxDecoration(
                color: color1,
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 17,
                  color: color2,
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}

Widget profileOverviewBtn(BuildContext context) {
  return GestureDetector(
    child: SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 19,
                backgroundColor: Colors.grey.shade400,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Miso Menze',
                    style: GoogleFonts.openSans(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: color3,
                    ),
                  ),
                  Text(
                    'Quickorder coins:   R50.90',
                    style: GoogleFonts.openSans(
                      color: color1,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Visibility paymentBtn(double width, bool visible, String total) {
  return Visibility(
    visible: visible,
    child: GestureDetector(
      onTap: () {},
      child: Container(
        width: width,
        height: 40,
        decoration: BoxDecoration(
          color: color1,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                MdiIcons.contactlessPayment,
                color: color2,
                size: 17,
              ),
              const SizedBox(
                width: 10,
              ),
              RichText(
                text: TextSpan(
                  text: 'Procced to payment of   ',
                  style: GoogleFonts.openSans(fontWeight: FontWeight.w700),
                  children: <TextSpan>[
                    TextSpan(
                      text: total,
                      style: GoogleFonts.openSans(
                          color: Colors.grey[300], fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}

Visibility couponBtn(BuildContext context, bool visible) {
  return Visibility(
    visible: visible,
    child: GestureDetector(
      onTap: () {},
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: 40,
        decoration: BoxDecoration(
          color: color3,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Boxicons.bxs_coupon,
                color: color2,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Apply Coupons',
                style: GoogleFonts.openSans(
                  fontWeight: FontWeight.bold,
                  color: color2,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Container cartItemCard(BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(bottom: 15),
    child: Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          // height: 80,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                width: 80,
                height: 60,
                child: Image(
                  image: NetworkImage(
                    'https://kauai.co.za/wp-content/uploads/2020/10/The-Normal-Burger-750x750px.jpg',
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Wacky wednesday',
                    style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w600, fontSize: 14),
                  ),
                  Card(
                    child: Row(
                      children: [
                        IconButton(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(0.0),
                          onPressed: () {},
                          icon: const Icon(
                            MdiIcons.minus,
                          ),
                        ),
                        Text(
                          '1',
                          style: GoogleFonts.openSans(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        IconButton(
                          onPressed: () {},
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(0.0),
                          icon: const Icon(
                            Icons.add,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(0.0),
                    icon: const Icon(
                      Icons.close,
                    ),
                  ),
                  Text(
                    'R50.00',
                    style: GoogleFonts.openSans(
                        fontWeight: FontWeight.normal, fontSize: 20),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ),
  );
}

itemSearchCard(Item item) {
  return ListTile(
    onTap: () {
      Get.toNamed('/restaurentview', arguments: {
        "itemID": item.id,
        "shopID": item.shopID,
      });
    },
    leading: CircleAvatar(
      backgroundImage: NetworkImage(
        item.imageUrl!,
      ),
    ),
    title: Row(
      children: [
        Text(
          item.itemName!,
          style: GoogleFonts.openSans(
            fontWeight: FontWeight.w600,
            color: color3,
          ),
        )
      ],
    ),
  );
}

shopSearchCard(Shop shop) {
  return ListTile(
    leading: CircleAvatar(
      backgroundImage: NetworkImage(
        shop.imageUrl!,
      ),
    ),
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          shop.shopName!,
          style: GoogleFonts.openSans(
            fontWeight: FontWeight.bold,
            color: color3,
          ),
        ),
        Text(
          shop.shopLocation!,
          style: GoogleFonts.openSans(
            fontWeight: FontWeight.w600,
            color: color3,
          ),
        ),
      ],
    ),
  );
}
