import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickorder/get/controllers/primary_controller.dart';

import '../../utils/reusable_widgets.dart';

class Restaurents extends StatelessWidget {
  const Restaurents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _primaryController = Get.find<PrimaryControler>();
    return Padding(
      padding: const EdgeInsets.all(0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  _primaryController.restaurents.length,
                  (index) => resturentCard(
                      _primaryController.restaurents[index], context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
