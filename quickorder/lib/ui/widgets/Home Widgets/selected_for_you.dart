import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickorder/ui/utils/reusable_constants.dart';

class ForYouCard extends StatelessWidget {
  const ForYouCard({Key? key}) : super(key: key);

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
                  'For you',
                  style: GoogleFonts.openSans(
                    color: color3,
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  ),
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: const Image(
                image: NetworkImage(
                    "https://debonairspizza.co.za/images/promos/2021/october/real-deal/Real-Deal-2x-Large-Pizza-Promo_Web-Promo-Banner_782x395_Generic.jpg"),
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
