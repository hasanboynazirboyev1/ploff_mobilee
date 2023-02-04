// To parse this JSON data, do
//
//     final productOrderModel = productOrderModelFromJson(jsonString);

import 'dart:convert';

ProductOrderModel productOrderModelFromJson(String str) => ProductOrderModel.fromJson(json.decode(str));

String productOrderModelToJson(ProductOrderModel data) => json.encode(data.toJson());

class ProductOrderModel {
    ProductOrderModel({
        required this.orders,
        required this.count,
    });

    List<Order> orders;
    String count;

    factory ProductOrderModel.fromJson(Map<String, dynamic> json) => ProductOrderModel(
        orders: List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
        count: json["count"],
    );

    Map<String, dynamic> toJson() => {
        "orders": List<dynamic>.from(orders.map((x) => x.toJson())),
        "count": count,
    };
}

class Order {
    Order({
        this.toLocation,
        this.toAddress,
         this.clientName,
         this.clientPhoneNumber,
         this.coDeliveryPrice,
         this.description,
        required this.externalOrderId,
         this.deliveryTime,
         this.deliveryType,
         this.id,
         this.clientId,
         this.courierId,
         this.courier,
         this.statusId,
         this.createdAt,
         this.finishedAt,
         this.paymentType,
         this.source,
         this.apartment,
         this.building,
         this.floor,
         this.extraPhoneNumber,
         this.orderAmount,
         this.paid,
         this.rating,
         this.review,
         this.steps,
         this.statusNotes,
         this.isCourierCall,
    });

    Location? toLocation;
    String? toAddress;
    String? clientName;
    String? clientPhoneNumber;
    int? coDeliveryPrice;
    String? description;
    String? externalOrderId;
    String? deliveryTime;
    String? deliveryType;
    String? id;
    String? clientId;
    String? courierId;
    Courier? courier;
    String? statusId;
    DateTime? createdAt;
    String? finishedAt;
    String? paymentType;
    String? source;
    String? apartment;
    String? building;
    String? floor;
    String? extraPhoneNumber;
    int? orderAmount;
    bool? paid;
    String? rating;
    String? review;
    List<Step>? steps;
    List<StatusNote>? statusNotes;
    bool? isCourierCall;

    factory Order.fromJson(Map<String, dynamic> json) => Order(
        toLocation: Location.fromJson(json["to_location"]),
        toAddress: json["to_address"],
        clientName: json["client_name"],
        clientPhoneNumber: json["client_phone_number"],
        coDeliveryPrice: json["co_delivery_price"],
        description: json["description"],
        externalOrderId: json["external_order_id"],
        deliveryTime: json["delivery_time"],
        deliveryType: json["delivery_type"],
        id: json["id"],
        clientId: json["client_id"],
        courierId: json["courier_id"],
        courier: Courier.fromJson(json["courier"]),
        statusId: json["status_id"],
        // createdAt: DateTime.parse(json["created_at"]),
        finishedAt: json["finished_at"],
        paymentType: json["payment_type"],
        source: json["source"],
        apartment: json["apartment"],
        building: json["building"],
        floor: json["floor"],
        extraPhoneNumber: json["extra_phone_number"],
        orderAmount: json["order_amount"],
        paid: json["paid"],
        rating: json["rating"],
        review: json["review"],
        steps: List<Step>.from(json["steps"].map((x) => Step.fromJson(x))),
        statusNotes: List<StatusNote>.from(json["status_notes"].map((x) => StatusNote.fromJson(x))),
        isCourierCall: json["is_courier_call"],
    );

    Map<String, dynamic> toJson() => {
        "to_location": toLocation!.toJson(),
        "to_address": toAddress,
        "client_name": clientName,
        "client_phone_number": clientPhoneNumber,
        "co_delivery_price": coDeliveryPrice,
        "description": description,
        "external_order_id": externalOrderId,
        "delivery_time": deliveryTime,
        "delivery_type": deliveryType,
        "id": id,
        "client_id": clientId,
        "courier_id": courierId,
        "courier": courier!.toJson(),
        "status_id": statusId,
        "created_at": createdAt!.toIso8601String(),
        "finished_at": finishedAt,
        "payment_type": paymentType,
        "source": source,
        "apartment": apartment,
        "building": building,
        "floor": floor,
        "extra_phone_number": extraPhoneNumber,
        "order_amount": orderAmount,
        "paid": paid,
        "rating": rating,
        "review": review,
        "steps": List<dynamic>.from(steps!.map((x) => x.toJson())),
        "status_notes": List<dynamic>.from(statusNotes!.map((x) => x.toJson())),
        "is_courier_call": isCourierCall,
    };
}

class Courier {
    Courier({
         this.phone,
         this.firstName,
         this.lastName,
         this.vehicleNumber,
        this.courierType,
         this.location,
    });

    String? phone;
    String? firstName;
    String? lastName;
    String? vehicleNumber;
    dynamic courierType;
    Location? location;

    factory Courier.fromJson(Map<String, dynamic> json) => Courier(
        phone: json["phone"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        vehicleNumber: json["vehicle_number"],
        courierType: json["courier_type"],
        location: Location.fromJson(json["location"]),
    );

    Map<String, dynamic> toJson() => {
        "phone": phone,
        "first_name": firstName,
        "last_name": lastName,
        "vehicle_number": vehicleNumber,
        "courier_type": courierType,
        "location": location!.toJson(),
    };
}

class Location {
    Location({
         this.long,
         this.lat,
    });

    double? long;
    double? lat;

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        long: json["long"]?.toDouble(),
        lat: json["lat"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "long": long,
        "lat": lat,
    };
}

class StatusNote {
    StatusNote({
         this.id,
         this.description,
         this.statusId,
         this.createdAt,
    });

    String? id;
    String? description;
    String? statusId;
    DateTime? createdAt;

    factory StatusNote.fromJson(Map<String, dynamic> json) => StatusNote(
        id: json["id"],
        description: json["description"],
        statusId: json["status_id"],
        createdAt: DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "status_id": statusId,
        "created_at": createdAt!.toIso8601String(),
    };
}

class Step {
    Step({
         this.branchName,
         this.branchId,
         this.phoneNumber,
         this.address,
         this.destinationAddress,
         this.location,
         this.description,
    });

    String? branchName;
    String? branchId;
    String? phoneNumber;
    String? address;
    String? destinationAddress;
    Location? location;
    String? description;

    factory Step.fromJson(Map<String, dynamic> json) => Step(
        branchName: json["branch_name"],
        branchId: json["branch_id"],
        phoneNumber: json["phone_number"],
        address: json["address"],
        destinationAddress: json["destination_address"],
        location: Location.fromJson(json["location"]),
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "branch_name": branchName,
        "branch_id": branchId,
        "phone_number": phoneNumber,
        "address": address,
        "destination_address": destinationAddress,
        "location": location!.toJson(),
        "description": description,
    };
}
