// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickorder/ui/widgets/Search%20widgets/personalized_searches.dart';
import 'package:quickorder/ui/widgets/Search%20widgets/search_categories.dart';
import 'package:quickorder/ui/widgets/Search%20widgets/search_results.dart';

import '../../get/controllers/primary_controller.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> with SingleTickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  late TabController _tabController;
  bool isCleanVisible = false;
  bool isTextFieldTapped = false;
  bool resultsVisible = false;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _pc = Get.find<PrimaryControler>();
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(
            body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Card(
                elevation: 3,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          if (isTextFieldTapped) {
                            FocusScope.of(context).unfocus();
                            setState(() {
                              isTextFieldTapped = false;
                            });
                          } else {
                            Get.back();
                          }
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          size: 20,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.65,
                        child: TextField(
                          controller: _searchController,
                          onChanged: (change) {
                            if (change.isNotEmpty) {
                              setState(() {
                                _pc.search(_searchController.text
                                    .toString()
                                    .toUpperCase());
                                isCleanVisible = true;
                                resultsVisible = true;
                              });
                            } else {
                              setState(() {
                                isCleanVisible = false;
                                resultsVisible = false;
                              });
                            }
                          },
                          onTap: () {
                            setState(() {
                              isTextFieldTapped = true;
                            });
                          },
                          onSubmitted: (v) {
                            _pc.search(_searchController.text.toUpperCase());
                          },
                          maxLines: 1,
                          keyboardType: TextInputType.name,
                          expands: false,
                          decoration: InputDecoration(
                            hintText: 'What are you looking for?',
                            hintStyle: GoogleFonts.openSans(
                                // fontSize: 13,
                                ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Visibility(
                        visible: isCleanVisible,
                        child: IconButton(
                          onPressed: () {
                            _searchController.clear();
                            setState(() {
                              isCleanVisible = false;
                              resultsVisible = false;
                            });
                          },
                          icon: const Icon(
                            Icons.close,
                            size: 17,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: chooseDisplay(),
              ),
            ],
          ),
        )),
      ),
    );
  }

  chooseDisplay() {
    if (!resultsVisible) {
      if (isTextFieldTapped) {
        return SearchesView(tabController: _tabController);
      } else {
        return const SearchCategories();
      }
    } else {
      return const SearchResults();
    }
  }
}
