import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:quickorder/ui/utils/reusable_constants.dart';

import '../utils/reusable_widgets.dart';

class AccountTab extends StatelessWidget {
  final TabController homeTabController;
  const AccountTab({Key? key, required this.homeTabController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String img =
        "https://storage.googleapis.com/gweb-uniblog-publish-prod/original_images/Google_Maps_city_image.jpg";

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              centerTitle: false,
              expandedHeight: MediaQuery.of(context).size.height * 0.4,
              title: profileOverviewBtn(context),
              flexibleSpace: FlexibleSpaceBar(
                background: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Image(
                    image: NetworkImage(img),
                  ),
                ),
              ),
            ),
            getSliverList(context),
          ],
        ),
      ),
    );
  }

  getSliverList(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          // const Divider(),
          // profileOverviewBtn(context),
          ListTile(
            onTap: () => homeTabController.animateTo(1),
            leading: const Icon(
              Icons.favorite_sharp,
              color: color1,
            ),
            // tileColor: color4,
            title: Text(
              'Your favourites',
              style: GoogleFonts.openSans(fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: const Icon(MdiIcons.wallet, color: color1),
            // tileColor: color4,
            title: Text(
              'Payment',
              style: GoogleFonts.openSans(fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: const Icon(MdiIcons.tag, color: color1),
            // tileColor: color4,
            title: Text(
              'Promotions',
              style: GoogleFonts.openSans(fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
              color: color1,
            ),
            // tileColor: color4,
            title: Text(
              'Settings',
              style: GoogleFonts.openSans(fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.notifications, color: color1),
            // tileColor: color4,
            title: Text(
              'Notifications',
              style: GoogleFonts.openSans(fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: const Icon(MdiIcons.themeLightDark, color: color1),
            // tileColor: color4,
            title: Text(
              'Appearance',
              style: GoogleFonts.openSans(fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: const Icon(MdiIcons.help, color: color1),
            // tileColor: color4,
            title: Text(
              'Help',
              style: GoogleFonts.openSans(fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            onTap: () => Get.toNamed('/admin'),
            leading: const Icon(MdiIcons.truckDelivery, color: color1),
            // tileColor: color4,
            title: Text(
              'Deliver with Quickorder',
              style: GoogleFonts.openSans(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
