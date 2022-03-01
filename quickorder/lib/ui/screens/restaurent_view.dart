// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:quickorder/ui/utils/reusable_constants.dart';

class RestaurentView extends StatefulWidget {
  const RestaurentView({Key? key}) : super(key: key);

  @override
  _RestaurentViewState createState() => _RestaurentViewState();
}

class _RestaurentViewState extends State<RestaurentView> {
  final ScrollController _scrollController = ScrollController();

  bool btnsVisible = true;

  @override
  void initState() {
    initController();
    super.initState();
  }

  void initController() {
    _scrollController.addListener(
      () {
        if (_scrollController.position.atEdge) {
          bool isTop = _scrollController.position.pixels == 0;
          if (isTop) {
            setState(() {
              btnsVisible = true;
            });
          } else {
            btnsVisible = false;
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(
          body: CustomScrollView(
            controller: _scrollController,
            slivers: [
              AppBarRestaurents(),
              getSlivers(),
            ],
          ),
        ),
      ),
    );
  }

  SliverAppBar AppBarRestaurents() {
    return SliverAppBar(
      backgroundColor: color2,
      expandedHeight: MediaQuery.of(context).size.height * 0.2,
      pinned: true,
      elevation: 0,
      leading: IconButton(
        color: color2,
        onPressed: () => Get.back(),
        icon: const Icon(
          Icons.arrow_back_ios,
          color: color1,
          size: 23,
        ),
      ),
      actions: [
        Visibility(
          visible: !btnsVisible,
          child: GestureDetector(
            onTap: () => print('tapped'),
            child: Container(
              width: 30,
              height: 30,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: color2,
              ),
              child: const Center(
                child: Icon(
                  Icons.menu,
                  color: color1,
                  size: 19,
                ),
              ),
            ),
          ),
        ),
        Visibility(
          visible: btnsVisible,
          child: GestureDetector(
            onTap: () => print('tapped'),
            child: Container(
              width: 30,
              height: 30,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: color2,
              ),
              child: const Center(
                child: Icon(
                  Icons.favorite_outline,
                  color: color1,
                  size: 19,
                ),
              ),
            ),
          ),
        ),
        Visibility(
          visible: btnsVisible,
          child: const SizedBox(
            width: 20,
          ),
        ),
        Visibility(
          visible: btnsVisible,
          child: GestureDetector(
            onTap: () => print('tapped'),
            child: Container(
              width: 30,
              height: 30,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: color2,
              ),
              child: const Center(
                child: Icon(
                  MdiIcons.share,
                  color: color1,
                  size: 19,
                ),
              ),
            ),
          ),
        ),
        Visibility(
          visible: btnsVisible,
          child: const SizedBox(
            width: 20,
          ),
        ),
        Visibility(
          visible: btnsVisible,
          child: GestureDetector(
            onTap: () => print('tapped'),
            child: Container(
              width: 30,
              height: 30,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: color2,
              ),
              child: const Center(
                child: Icon(
                  Icons.search,
                  color: color1,
                  size: 19,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Romans Pizza',
              style: GoogleFonts.openSans(
                color: color1,
              ),
            ),
          ],
        ),
        background: const Image(
          image: NetworkImage(
            'https://www.simplyrecipes.com/thmb/8caxM88NgxZjz-T2aeRW3xjhzBg=/2000x1125/smart/filters:no_upscale()/__opt__aboutcom__coeus__resources__content_migration__simply_recipes__uploads__2019__09__easy-pepperoni-pizza-lead-3-8f256746d649404baa36a44d271329bc.jpg',
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget getSlivers() {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.4,
            color: color2,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.4,
            color: color2,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.4,
            color: color1,
          ),
        ],
      ),
    );
  }
}
