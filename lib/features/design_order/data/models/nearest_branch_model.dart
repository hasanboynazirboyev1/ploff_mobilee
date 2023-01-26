// To parse this JSON data, do
//
//     final nearestBranchModel = nearestBranchModelFromJson(jsonString);

import 'dart:convert';

NearestBranchModel nearestBranchModelFromJson(String str) => NearestBranchModel.fromJson(json.decode(str));

String nearestBranchModelToJson(NearestBranchModel data) => json.encode(data.toJson());

class NearestBranchModel {
    NearestBranchModel({
        required this.branches,
    });

    List<Branch> branches;

    factory NearestBranchModel.fromJson(Map<String, dynamic> json) => NearestBranchModel(
        branches: List<Branch>.from(json["branches"].map((x) => Branch.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "branches": List<dynamic>.from(branches.map((x) => x.toJson())),
    };
}

class Branch {
    Branch({
        required this.id,
        required this.shipperId,
        required this.name,
        this.image,
        required this.phone,
        required this.isActive,
        required this.address,
        required this.location,
        required this.createdAt,
        required this.updatedAt,
        required this.destination,
        required this.workHourStart,
        required this.workHourEnd,
        this.jowiId,
        this.iikoId,
        this.iikoTerminalId,
        required this.fareId,
        required this.tgChatId,
        this.geozoneId,
        this.geozone,
        required this.ordersLimit,
        required this.radiusWithoutDeliveryPrice,
        required this.realTimeOrdersAmount,
        this.fare,
        this.menuId,
        this.menuTitle,
        required this.crm,
    });

    String id;
    String shipperId;
    String name;
    String? image;
    String phone;
    bool isActive;
    String address;
    Location location;
    DateTime createdAt;
    String updatedAt;
    String destination;
    String workHourStart;
    String workHourEnd;
    String? jowiId;
    String? iikoId;
    String? iikoTerminalId;
    String fareId;
    String tgChatId;
    dynamic geozoneId;
    dynamic geozone;
    String ordersLimit;
    int radiusWithoutDeliveryPrice;
    int realTimeOrdersAmount;
    dynamic fare;
    String? menuId;
    dynamic menuTitle;
    String crm;

    factory Branch.fromJson(Map<String, dynamic> json) => Branch(
        id: json["id"],
        shipperId: json["shipper_id"],
        name: json["name"],
        image: json["image"],
        phone: json["phone"],
        isActive: json["is_active"],
        address: json["address"],
        location: Location.fromJson(json["location"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
        destination: json["destination"],
        workHourStart: json["work_hour_start"],
        workHourEnd: json["work_hour_end"],
        jowiId: json["jowi_id"],
        iikoId: json["iiko_id"],
        iikoTerminalId: json["iiko_terminal_id"],
        fareId: json["fare_id"],
        tgChatId: json["tg_chat_id"],
        geozoneId: json["geozone_id"],
        geozone: json["geozone"],
        ordersLimit: json["orders_limit"],
        radiusWithoutDeliveryPrice: json["radius_without_delivery_price"],
        realTimeOrdersAmount: json["real_time_orders_amount"],
        fare: json["fare"],
        menuId: json["menu_id"],
        menuTitle: json["menu_title"],
        crm: json["crm"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "shipper_id": shipperId,
        "name": name,
        "image": image,
        "phone": phone,
        "is_active": isActive,
        "address": address,
        "location": location.toJson(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt,
        "destination": destination,
        "work_hour_start": workHourStart,
        "work_hour_end": workHourEnd,
        "jowi_id": jowiId,
        "iiko_id": iikoId,
        "iiko_terminal_id": iikoTerminalId,
        "fare_id": fareId,
        "tg_chat_id": tgChatId,
        "geozone_id": geozoneId,
        "geozone": geozone,
        "orders_limit": ordersLimit,
        "radius_without_delivery_price": radiusWithoutDeliveryPrice,
        "real_time_orders_amount": realTimeOrdersAmount,
        "fare": fare,
        "menu_id": menuId,
        "menu_title": menuTitle,
        "crm": crm,
    };
}

class Location {
    Location({
        required this.long,
        required this.lat,
    });

    double long;
    double lat;

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        long: json["long"]?.toDouble(),
        lat: json["lat"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "long": long,
        "lat": lat,
    };
}
