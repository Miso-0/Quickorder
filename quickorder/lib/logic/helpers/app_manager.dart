import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:quickorder/logic/models/models.dart';

Future<String> getTestContent() async {
  String filePath = "lib/data/shops.json";
  String fileContent = await rootBundle.loadString(filePath);
  return fileContent;
}

Future<AppData> loadShops() async {
  var data = json.decode(await getTestContent());
  AppData appdata = AppData.fromJson(data);
  return appdata;
}
