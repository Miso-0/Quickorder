import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../get/controllers/primary_controller.dart';
import '../../../logic/models/models.dart';
import '../../utils/reusable_widgets.dart';

class RestaurentResults extends StatefulWidget {
  const RestaurentResults({Key? key}) : super(key: key);

  @override
  _RestaurentResultsState createState() => _RestaurentResultsState();
}

class _RestaurentResultsState extends State<RestaurentResults> {
  @override
  Widget build(BuildContext context) {
    var _pc = Get.find<PrimaryControler>();
    return Obx(
      () => Container(
        margin: const EdgeInsets.fromLTRB(5, 10, 5, 0),
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          itemCount: _pc.search_results.length,
          itemBuilder: ((context, index) => _pc.search_results[index] is Shop
              ? shopSearchCard(
                  _pc.search_results[index],
                )
              : const SizedBox()),
        ),
      ),
    );
  }
}
