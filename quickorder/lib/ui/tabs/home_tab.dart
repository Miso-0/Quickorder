import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickorder/ui/utils/reusable_constants.dart';

import 'package:quickorder/ui/widgets/Home%20Widgets/restaurents.dart';

import '../../get/controllers/primary_controller.dart';
import '../widgets/Home Widgets/categories.dart';
import '../widgets/Home Widgets/popular.dart';
import '../widgets/Home Widgets/selected_for_you.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String exampleImage =
        'https://scontent-jnb1-1.cdninstagram.com/v/t51.2885-19/s150x150/248993712_609335856915145_4674976349068797108_n.jpg?_nc_ht=scontent-jnb1-1.cdninstagram.com&_nc_cat=101&_nc_ohc=GCNshEVPEAAAX-hBgYx&edm=ABfd0MgBAAAA&ccb=7-4&oh=00_AT8JWrrMGlQJAD3Po4ebcSkoxIAzE82DO4ArCuANVSshbg&oe=620B48F8&_nc_sid=7bff83';
    var _pc = Get.find<PrimaryControler>();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: false,
            pinned: true,
            snap: false,
            stretch: true,
            backgroundColor: color2,
            elevation: 0,
            expandedHeight: MediaQuery.of(context).size.height * 0.22,
            centerTitle: false,
            title: TextButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.location_on,
                color: color1,
                size: 17,
              ),
              label: Text(
                'Johannesburg, SA',
                style: GoogleFonts.openSans(
                  color: color3,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            actions: [
              Visibility(
                  visible: false,
                  child: GestureDetector(
                    child: Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: CircleAvatar(
                        radius: 16,
                        backgroundImage: NetworkImage(exampleImage),
                      ),
                    ),
                  )),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                // color: Colors.black,
                margin: const EdgeInsets.only(top: 50),
                padding: const EdgeInsets.fromLTRB(
                  20,
                  10,
                  10,
                  0,
                ),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Hey!',
                      style: GoogleFonts.openSans(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: color3,
                      ),
                    ),
                    Text(
                      'Lets get your order',
                      style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: color4,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () => Get.toNamed('/search'),
                      child: Card(
                        elevation: 5,
                        color: Colors.transparent,
                        child: Container(
                          // margin: const EdgeInsets.only(top: 15),
                          width: MediaQuery.of(context).size.width,
                          height: 35,
                          decoration: BoxDecoration(
                            color: color2,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(width: 10),
                              const Icon(
                                Icons.search,
                                color: color4,
                                size: 19,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                'Looking for something specific?',
                                style: GoogleFonts.openSans(
                                  color: color4,
                                  fontSize: 13,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          getSliverWidgets(),
        ],
      ),
    );
  }

  getSliverWidgets() {
    return SliverList(
      delegate: SliverChildListDelegate([
        const Restaurents(),
        const Categories(),
        const Popular(),
        const ForYouCard(),
      ]),
    );
  }
}
