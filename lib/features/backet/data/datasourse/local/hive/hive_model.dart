// To parse this JSON data, do
//
//     final oneProductModelHive = oneProductModelHiveFromJson(jsonString);

import 'dart:convert';

import 'package:hive/hive.dart';
part 'hive_model.g.dart';

OneProductModelHive oneProductModelHiveFromJson(String str) =>
    OneProductModelHive.fromJson(json.decode(str));

String oneProductModelHiveToJson(OneProductModelHive data) =>
    json.encode(data.toJson());

@HiveType(typeId: 0)
class OneProductModelHive {
  OneProductModelHive({
    required this.id,
    required this.slug,
    required this.title,
    required this.code,
    required this.description,
    // required this.categories,
    this.brand,
    required this.isDivisible,
    required this.count,
    required this.tags,
    this.measurement,
    this.rate,
    required this.inPrice,
    required this.outPrice,
    required this.image,
    required this.gallery,
    required this.favourites,
    required this.active,
    required this.order,
    required this.createdAt,
    required this.iikoId,
    required this.jowiId,
    required this.shipperId,
    required this.priceChangers,
    required this.currency,
    required this.type,
    required this.properties,
    required this.productProperty,
    required this.iikoSourceActionId,
    required this.iikoGroupId,
    required this.activeInMenu,
    required this.offAlways,
    required this.fromTime,
    required this.toTime,
    required this.ikpu,
    required this.packageCode,
    required this.variantProducts,
    required this.parentId,
    required this.hasModifier,
    required this.rkeeperId,
  });
  @HiveField(0)
  String id;
  @HiveField(1)
  String slug;
  @HiveField(2)
  String title;
  @HiveField(3)
  String code;
  @HiveField(4)
  String description;
  @HiveField(5)
  // List<Category> categories;
  dynamic brand;
  @HiveField(6)
  bool isDivisible;
  @HiveField(7)
  String count;
  @HiveField(8)
  List<dynamic> tags;
  @HiveField(9)
  dynamic measurement;
  @HiveField(10)
  dynamic rate;
  @HiveField(11)
  int inPrice;
  @HiveField(12)
  int outPrice;
  @HiveField(13)
  String image;
  @HiveField(14)
  List<dynamic> gallery;
  @HiveField(15)
  List<dynamic> favourites;
  @HiveField(16)
  bool active;
  @HiveField(17)
  String order;
  @HiveField(18)
  String createdAt;
  @HiveField(19)
  String iikoId;
  @HiveField(20)
  String jowiId;
  @HiveField(21)
  String shipperId;
  @HiveField(22)
  List<dynamic> priceChangers;
  @HiveField(23)
  String currency;
  @HiveField(24)
  String type;
  @HiveField(25)
  List<dynamic> properties;
  @HiveField(26)
  List<dynamic> productProperty;
  @HiveField(27)
  String iikoSourceActionId;
  @HiveField(28)
  String iikoGroupId;
  @HiveField(29)
  bool activeInMenu;
  @HiveField(30)
  bool offAlways;
  @HiveField(31)
  String fromTime;
  @HiveField(32)
  String toTime;
  @HiveField(33)
  String ikpu;
  @HiveField(34)
  String packageCode;
  @HiveField(35)
  List<dynamic> variantProducts;
  @HiveField(36)
  String parentId;
  @HiveField(38)
  bool hasModifier;
  @HiveField(39)
  String rkeeperId;

  factory OneProductModelHive.fromJson(Map<String, dynamic> json) =>
      OneProductModelHive(
        id: json["id"],
        slug: json["slug"],
        title: json['title'],
        code: json["code"],
        description: json['description'],
        // categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
        brand: json["brand"],
        isDivisible: json["is_divisible"],
        count: json["count"],
        tags: List<dynamic>.from(json["tags"].map((x) => x)),
        measurement: json["measurement"],
        rate: json["rate"],
        inPrice: json["in_price"],
        outPrice: json["out_price"],
        image: json["image"],
        gallery: List<dynamic>.from(json["gallery"].map((x) => x)),
        favourites: List<dynamic>.from(json["favourites"].map((x) => x)),
        active: json["active"],
        order: json["order"],
        createdAt: json["created_at"],
        iikoId: json["iiko_id"],
        jowiId: json["jowi_id"],
        shipperId: json["shipper_id"],
        priceChangers: List<dynamic>.from(json["price_changers"].map((x) => x)),
        currency: json["currency"],
        type: json["type"],
        properties: List<dynamic>.from(json["properties"].map((x) => x)),
        productProperty:
            List<dynamic>.from(json["product_property"].map((x) => x)),
        iikoSourceActionId: json["iiko_source_action_id"],
        iikoGroupId: json["iiko_group_id"],
        activeInMenu: json["active_in_menu"],
        offAlways: json["off_always"],
        fromTime: json["from_time"],
        toTime: json["to_time"],
        ikpu: json["ikpu"],
        packageCode: json["package_code"],
        variantProducts:
            List<dynamic>.from(json["variant_products"].map((x) => x)),
        parentId: json["parent_id"],
        hasModifier: json["has_modifier"],
        rkeeperId: json["rkeeper_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "title": title,
        "code": code,
        "description": description,
        // "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "brand": brand,
        "is_divisible": isDivisible,
        "count": count,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "measurement": measurement,
        "rate": rate,
        "in_price": inPrice,
        "out_price": outPrice,
        "image": image,
        "gallery": List<dynamic>.from(gallery.map((x) => x)),
        "favourites": List<dynamic>.from(favourites.map((x) => x)),
        "active": active,
        "order": order,
        "created_at": createdAt,
        "iiko_id": iikoId,
        "jowi_id": jowiId,
        "shipper_id": shipperId,
        "price_changers": List<dynamic>.from(priceChangers.map((x) => x)),
        "currency": currency,
        "type": type,
        "properties": List<dynamic>.from(properties.map((x) => x)),
        "product_property": List<dynamic>.from(productProperty.map((x) => x)),
        "iiko_source_action_id": iikoSourceActionId,
        "iiko_group_id": iikoGroupId,
        "active_in_menu": activeInMenu,
        "off_always": offAlways,
        "from_time": fromTime,
        "to_time": toTime,
        "ikpu": ikpu,
        "package_code": packageCode,
        "variant_products": List<dynamic>.from(variantProducts.map((x) => x)),
        "parent_id": parentId,
        "has_modifier": hasModifier,
        "rkeeper_id": rkeeperId,
      };
  OneProductModelHive copyWith(
   { String? id,
    String? slug,
    String? title,
    String? code,
    String? description,
    dynamic brand,
    bool? isDivisible,
    String? count,
    List<dynamic>? tags,
    dynamic measurement,
    dynamic rate,
    int? inPrice,
    int? outPrice,
    String? image,
    List<dynamic>? gallery,
    List<dynamic>? favourites,
    bool? active,
    String? order,
    String? createdAt,
    String? iikoId,
    String? jowiId,
    String? shipperId,
    List<dynamic>? priceChangers,
    String? currency,
    String? type,
    List<dynamic>? properties,
    List<dynamic>? productProperty,
    String? iikoSourceActionId,
    String? iikoGroupId,
    bool? activeInMenu,
    bool? offAlways,
    String? fromTime,
    String? toTime,
    String? ikpu,
    String? packageCode,
    List<dynamic>? variantProducts,
    String? parentId,
    bool? hasModifier,
    String? rkeeperId,}
  ) {
    return OneProductModelHive(
        id: id ?? this.id,
        slug: slug ?? this.slug,
        title: title ?? this.title,
        code: code ?? this.code,
        description: description ?? this.description,
        isDivisible: isDivisible ?? this.isDivisible,
        count: count ?? this.count,
        tags: tags ?? this.tags,
        inPrice: inPrice ?? this.inPrice,
        outPrice: outPrice ?? this.outPrice,
        image: image ?? this.image,
        gallery: gallery ?? this.gallery,
        favourites: favourites ?? this.favourites,
        active: active ?? this.active,
        order: order ?? this.order,
        createdAt: createdAt ?? this.createdAt,
        iikoId: iikoId ?? this.iikoId,
        jowiId: jowiId ?? this.jowiId,
        shipperId: shipperId ?? this.shipperId,
        priceChangers: priceChangers ?? this.priceChangers,
        currency: this.currency,
        type: type ?? this.type,
        properties: properties ?? this.properties,
        productProperty: productProperty ?? this.productProperty,
        iikoSourceActionId: iikoSourceActionId ?? this.iikoSourceActionId,
        iikoGroupId: iikoGroupId ?? this.iikoGroupId,
        activeInMenu: activeInMenu ?? this.activeInMenu,
        offAlways: offAlways ?? this.offAlways,
        fromTime: fromTime ?? this.fromTime,
        toTime: toTime ?? this.toTime,
        ikpu: ikpu ?? this.ikpu,
        packageCode: packageCode ?? this.packageCode,
        variantProducts: variantProducts ?? this.variantProducts,
        parentId: parentId ?? this.parentId,
        hasModifier: hasModifier ?? this.hasModifier,
        rkeeperId: rkeeperId ?? this.rkeeperId);
  }
}
