// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

AppData welcomeFromJson(String str) => AppData.fromJson(json.decode(str));

String welcomeToJson(AppData data) => json.encode(data.toJson());

class AppData {
  AppData({
    this.shops,
  });

  List<Shop>? shops;

  factory AppData.fromJson(Map<String, dynamic> json) => AppData(
        shops: List<Shop>.from(json["Shops"].map((x) => Shop.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Shops": List<dynamic>.from(shops!.map((x) => x.toJson())),
      };
}

class Shop {
  Shop({
    this.id,
    this.shopName,
    this.shopLocation,
    this.openTime,
    this.closeTime,
    this.imageUrl,
    this.adheaderImgUrl,
    this.categories,
    this.items,
  });

  String? id;
  String? shopName;
  String? shopLocation;
  String? openTime;
  String? closeTime;
  String? imageUrl;
  String? adheaderImgUrl;
  List<Category>? categories;
  List<Item>? items;

  factory Shop.fromJson(Map<String, dynamic> json) => Shop(
        id: json["id"],
        shopName: json["shopName"],
        shopLocation: json["shopLocation"],
        openTime: json["openTime"],
        closeTime: json["closeTime"],
        imageUrl: json["imageUrl"],
        adheaderImgUrl: json["adheaderImgUrl"],
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
        items: List<Item>.from(json["Items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "shopName": shopName,
        "shopLocation": shopLocation,
        "openTime": openTime,
        "closeTime": closeTime,
        "imageUrl": imageUrl,
        "adheaderImgUrl": adheaderImgUrl,
        "categories": List<dynamic>.from(categories!.map((x) => x.toJson())),
        "Items": List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class Category {
  Category({
    this.catId,
    this.catName,
  });

  String? catId;
  String? catName;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        catId: json["catID"],
        catName: json["catName"],
      );

  Map<String, dynamic> toJson() => {
        "catID": catId,
        "catName": catName,
      };
}

class Item {
  Item({
    this.id,
    this.shopID,
    this.itemName,
    this.itemDescription,
    this.catId,
    this.imageUrl,
    this.itemPrice,
  });

  String? id;
  String? shopID;
  String? itemName;
  String? itemDescription;
  String? catId;
  String? imageUrl;
  double? itemPrice;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        shopID: json["shopID"].toString(),
        itemName: json["itemName"],
        itemDescription: json["itemDescription"],
        catId: json["catID"],
        imageUrl: json["imageUrl"],
        itemPrice: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "shopID": shopID,
        "itemName": itemName,
        "itemDescription": itemDescription,
        "catID": catId,
        "imageUrl": imageUrl,
        "price": itemPrice,
      };
}
