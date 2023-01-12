// To parse this JSON data, do
//
//     final bannersModel = bannersModelFromJson(jsonString);

import 'dart:convert';

BannersModel bannersModelFromJson(String str) => BannersModel.fromJson(json.decode(str));

String bannersModelToJson(BannersModel data) => json.encode(data.toJson());

class BannersModel {
    BannersModel({
        this.banners,
        this.count,
    });

    List<Banner>? banners;
    String? count;

    factory BannersModel.fromJson(Map<String, dynamic> json) => BannersModel(
        banners: List<Banner>.from(json["banners"].map((x) => Banner.fromJson(x))),
        count: json["count"],
    );

    Map<String, dynamic> toJson() => {
        "banners": List<dynamic>.from(banners!.map((x) => x.toJson())),
        "count": count,
    };
}

class Banner {
    Banner({
        this.id,
        this.title,
        this.position,
        this.image,
        this.url,
        this.active,
        this.createdAt,
        this.updatedAt,
        this.shipperId,
        this.about,
    });

    String? id;
    Title ?title;
    String ?position;
    String ?image;
    String ?url;
    bool ?active;
    String ?createdAt;
    String ?updatedAt;
    String ?shipperId;
    String ?about;

    factory Banner.fromJson(Map<String, dynamic> json) => Banner(
        id: json["id"],
        title: Title.fromJson(json["title"]),
        position: json["position"],
        image: json["image"],
        url: json["url"],
        active: json["active"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        shipperId: json["shipper_id"],
        about: json["about"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title!.toJson(),
        "position": position,
        "image": image,
        "url": url,
        "active": active,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "shipper_id": shipperId,
        "about": about,
    };
}

class Title {
    Title({
        this.uz,
        this.ru,
        this.en,
    });

    String ?uz;
    String ?ru;
    String ?en;

    factory Title.fromJson(Map<String, dynamic> json) => Title(
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
