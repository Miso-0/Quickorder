import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickorder/ui/utils/reusable_constants.dart';

class Popular extends StatelessWidget {
  const Popular({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(21.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Popular',
                  style: GoogleFonts.openSans(
                    color: color3,
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Text(
                        'View all',
                        style: GoogleFonts.openSans(
                          color: color1,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 10,
                        color: color1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 160,
              child: const Image(
                image: NetworkImage(
                  "https://steers.co.za/images/media/promos/2021/december/phanda-burger/promo/phanda-burger-meal_web-blocks_promo-blocks_1280x591.webp",
                ),
                fit: BoxFit.contain,
              ),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
            )
          ],
        ),
      ),
    );
  }
}
