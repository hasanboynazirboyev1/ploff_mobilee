// To parse this JSON data, do
//
//     final customerAdressModel = customerAdressModelFromJson(jsonString);

import 'dart:convert';

CustomerAdressModel customerAdressModelFromJson(String str) => CustomerAdressModel.fromJson(json.decode(str));

String customerAdressModelToJson(CustomerAdressModel data) => json.encode(data.toJson());

class CustomerAdressModel {
    CustomerAdressModel({
        required this.customerAddresses,
        required this.count,
        required this.minimalOrderPrice,
    });

    List<CustomerAddress> customerAddresses;
    String count;
    int minimalOrderPrice;

    factory CustomerAdressModel.fromJson(Map<String, dynamic> json) => CustomerAdressModel(
        customerAddresses: List<CustomerAddress>.from(json["customer_addresses"].map((x) => CustomerAddress.fromJson(x))),
        count: json["count"],
        minimalOrderPrice: json["minimal_order_price"],
    );

    Map<String, dynamic> toJson() => {
        "customer_addresses": List<dynamic>.from(customerAddresses.map((x) => x.toJson())),
        "count": count,
        "minimal_order_price": minimalOrderPrice,
    };
}

class CustomerAddress {
    CustomerAddress({
        required this.id,
        required this.customerId,
        required this.name,
        required this.address,
        required this.location,
        this.apartment,
        this.building,
        this.floor,
        this.description,
    });

    String id;
    String customerId;
    String name;
    String address;
    Location location;
    dynamic apartment;
    dynamic building;
    dynamic floor;
    dynamic description;

    factory CustomerAddress.fromJson(Map<String, dynamic> json) => CustomerAddress(
        id: json["id"],
        customerId: json["customer_id"],
        name: json["name"],
        address: json["address"],
        location: Location.fromJson(json["location"]),
        apartment: json["apartment"],
        building: json["building"],
        floor: json["floor"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "customer_id": customerId,
        "name": name,
        "address": address,
        "location": location.toJson(),
        "apartment": apartment,
        "building": building,
        "floor": floor,
        "description": description,
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
