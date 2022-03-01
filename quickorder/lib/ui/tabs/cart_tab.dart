import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickorder/ui/utils/reusable_constants.dart';

import '../utils/reusable_widgets.dart';

class CartTab extends StatefulWidget {
  const CartTab({Key? key}) : super(key: key);

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  double cardheight = 310;
  double totalheight = 200;
  double width = 300;
  bool expandeVisible = true;
  bool expandeLessVisible = false;
  bool totalsVisible = true;
  bool couponVisible = true;
  bool payVisible = false;

  openCloseCard() {
    if (cardheight == 310) {
      cardheight = 45;
      expandeVisible = false;
      expandeLessVisible = true;
      totalsVisible = false;
      couponVisible = false;
      payVisible = true;
      totalheight = 0;
    } else {
      expandeVisible = true;
      expandeLessVisible = false;
      totalsVisible = true;
      couponVisible = true;
      payVisible = false;
      totalheight = 200;
      cardheight = 310;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          'Cart',
          style:
              GoogleFonts.openSans(fontWeight: FontWeight.bold, color: color3),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  cartItemCard(context),
                  cartItemCard(context),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50,
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AnimatedContainer(
        width: MediaQuery.of(context).size.width,
        height: cardheight,
        color: Colors.transparent,
        duration: const Duration(seconds: 1),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Visibility(
                    visible: expandeVisible,
                    child: IconButton(
                      onPressed: () {
                        openCloseCard();
                      },
                      icon: const Icon(
                        Icons.expand_more,
                        color: color1,
                        size: 40,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: expandeLessVisible,
                    child: IconButton(
                      onPressed: () {
                        openCloseCard();
                      },
                      icon: const Icon(
                        Icons.expand_less,
                        color: color1,
                        size: 40,
                      ),
                    ),
                  ),
                  couponBtn(context, couponVisible),
                  paymentBtn(MediaQuery.of(context).size.width * 0.8,
                      payVisible, 'R99.99'),
                ],
              ),
              Container(
                color: const Color.fromARGB(255, 253, 242, 242),
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Item Total',
                            style: GoogleFonts.openSans(
                              fontSize: 18,
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'R99.99',
                            style: GoogleFonts.openSans(
                              fontSize: 18,
                              color: color3,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Delivery Charge',
                            style: GoogleFonts.openSans(
                              fontSize: 18,
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'R4.99',
                            style: GoogleFonts.openSans(
                              fontSize: 18,
                              color: color3,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Tax',
                            style: GoogleFonts.openSans(
                              fontSize: 18,
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'R0.75',
                            style: GoogleFonts.openSans(
                              fontSize: 18,
                              color: color3,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total:',
                            style: GoogleFonts.openSans(
                              fontSize: 18,
                              color: color3,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'R99.99',
                            style: GoogleFonts.openSans(
                              fontSize: 18,
                              color: color3,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              paymentBtn(MediaQuery.of(context).size.width * 0.98, !payVisible,
                  'R99.99'),
            ],
          ),
        ),
      ),
    );
  }
}
