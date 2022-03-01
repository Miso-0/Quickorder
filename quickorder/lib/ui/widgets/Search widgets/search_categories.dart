import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickorder/ui/utils/reusable_constants.dart';

import '../../../logic/models/widget_models.dart';

class SearchCategories extends StatelessWidget {
  const SearchCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cats = [
      CategoryModel(
          id: 0,
          name: 'Burgers',
          imagePath: 'lib/assets/burger.png',
          isSelected: true),
      CategoryModel(
          id: 1,
          name: 'Pizza',
          imagePath: 'lib/assets/pizza.png',
          isSelected: false),
      CategoryModel(
          id: 2,
          name: 'Cakes',
          imagePath: 'lib/assets/cake.png',
          isSelected: false),
      CategoryModel(
          id: 3,
          name: 'Cakes',
          imagePath: 'lib/assets/cake.png',
          isSelected: false),
      CategoryModel(
          id: 0,
          name: 'Burgers',
          imagePath: 'lib/assets/burger.png',
          isSelected: true),
      CategoryModel(
          id: 1,
          name: 'Pizza',
          imagePath: 'lib/assets/pizza.png',
          isSelected: false),
      CategoryModel(
          id: 2,
          name: 'Cakes',
          imagePath: 'lib/assets/cake.png',
          isSelected: false),
      CategoryModel(
          id: 3,
          name: 'Cakes',
          imagePath: 'lib/assets/cake.png',
          isSelected: false),
    ];
    return SizedBox(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text(
                'Top Categories',
                style: GoogleFonts.openSans(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: color3,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(
                cats.length,
                (index) => searchCatCard(
                  cats[index],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget searchCatCard(CategoryModel cat) {
    return Card(
      child: Column(
        children: [
          SizedBox(
            height: 130,
            child: Image(
              image: AssetImage(cat.imagePath),
            ),
          ),
          Text(
            '${cat.name}',
            style: GoogleFonts.openSans(
              fontWeight: FontWeight.bold,
              color: color3,
            ),
          ),
        ],
      ),
    );
  }
}
