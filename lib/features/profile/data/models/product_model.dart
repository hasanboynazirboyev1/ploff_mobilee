// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

class ProductModel {
    ProductModel({
        this.categories,
        this.count,
    });

    List<Categorys>? categories;
    String ?count;

    factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        categories: List<Categorys>.from(json["categories"].map((x) => Categorys.fromJson(x))),
        count: json["count"],
    );

    Map<String, dynamic> toJson() => {
        "categories": List<dynamic>.from(categories!.map((x) => x.toJson())),
        "count": count,
    };
}

class Categorys {
    Categorys({
        this.id,
        this.slug,
        this.parentId,
        this.image,
        this.description,
        this.title,
        this.orderNo,
        this.active,
        this.products,
    });

    String ?id;
    String ?slug;
    String ?parentId;
    String ?image;
    Description? description;
    Description? title;
    String? orderNo;
    bool? active;
    List<Product>? products;

    factory Categorys.fromJson(Map<String, dynamic> json) => Categorys(
        id: json["id"],
        slug: json["slug"],
        parentId: json["parent_id"],
        image: json["image"],
        description: Description.fromJson(json["description"]),
        title: Description.fromJson(json["title"]),
        orderNo: json["order_no"],
        active: json["active"],
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "parent_id": parentId,
        "image": image,
        "description": description!.toJson(),
        "title": title!.toJson(),
        "order_no": orderNo,
        "active": active,
        "products": List<dynamic>.from(products!.map((x) => x.toJson())),
    };
}

class Description {
    Description({
        this.uz,
        this.ru,
        this.en,
    });

    String ?uz;
    String ?ru;
    String ?en;

    factory Description.fromJson(Map<String, dynamic> json) => Description(
        uz: json["uz"],
        ru: json["ru"],
        en: json["en"],
    );

    Map<String, dynamic> toJson() => {
        "uz": uz,
        "ru": ru,
        "en": en,
    };
}

class Product {
    Product({
        this.id,
        this.outPrice,
        this.currency,
        this.string,
        this.type,
        this.categories,
        this.brandId,
        this.rateId,
        this.image,
        this.activeInMenu,
        this.hasModifier,
        this.fromTime,
        this.toTime,
        this.offAlways,
        this.gallery,
        this.title,
        this.description,
        this.active,
        this.iikoId,
        this.jowiId,
    });

    String ?id;
    int ?outPrice;
    String? currency;
    String? string;
    String? type;
    List<String>? categories;
    String? brandId;
    String ?rateId;
    String ?image;
    bool ?activeInMenu;
    bool ?hasModifier;
    String ?fromTime;
    String ?toTime;
    bool ?offAlways;
    dynamic gallery;
    Description ?title;
    Description ?description;
    bool ?active;
    String ?iikoId;
    String ?jowiId;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        outPrice: json["out_price"],
        currency: json["currency"],
        string: json["string"],
        type: json["type"],
        categories: List<String>.from(json["categories"].map((x) => x)),
        brandId: json["brand_id"],
        rateId: json["rate_id"],
        image: json["image"],
        activeInMenu: json["active_in_menu"],
        hasModifier: json["has_modifier"],
        fromTime: json["from_time"],
        toTime: json["to_time"],
        offAlways: json["off_always"],
        gallery: json["gallery"],
        title: Description.fromJson(json["title"]),
        description: Description.fromJson(json["description"]),
        active: json["active"],
        iikoId: json["iiko_id"],
        jowiId: json["jowi_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "out_price": outPrice,
        "currency": currency,
        "string": string,
        "type": type,
        "categories": List<dynamic>.from(categories!.map((x) => x)),
        "brand_id": brandId,
        "rate_id": rateId,
        "image": image,
        "active_in_menu": activeInMenu,
        "has_modifier": hasModifier,
        "from_time": fromTime,
        "to_time": toTime,
        "off_always": offAlways,
        "gallery": gallery,
        "title": title!.toJson(),
        "description": description!.toJson(),
        "active": active,
        "iiko_id": iikoId,
        "jowi_id": jowiId,
    };
}
