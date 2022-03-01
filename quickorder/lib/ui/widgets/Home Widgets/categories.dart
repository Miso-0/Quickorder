import 'package:flutter/material.dart';
import 'package:quickorder/logic/models/widget_models.dart';
import 'package:quickorder/ui/utils/reusable_widgets.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

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
    ];
    return Padding(
      padding: const EdgeInsets.all(0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              cats.length,
              (index) => catCard(cats[index], context),
            ),
          ),
        ),
      ),
    );
  }
}
