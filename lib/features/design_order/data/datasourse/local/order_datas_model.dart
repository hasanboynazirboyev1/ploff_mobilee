// To parse this JSON data, do
//
//     final orderDatasModel = orderDatasModelFromJson(jsonString);

// pdezd qavat kvartira
import 'package:hive/hive.dart';
part 'order_datas_model.g.dart';

@HiveType(typeId: 1)
class OrderDatasModel {
  OrderDatasModel({
    this.apartment,
    this.building,
    this.clientId,
    this.coDeliveryPrice,
    this.deliveryTime,
    this.deliveryType,
    this.description,
    this.isCourierCall,
    this.extraPhoneNumber,
    this.floor,
    this.paid,
    this.paymentType,
    this.source,
    this.statusId,
    this.toAddress,
    this.futureTime,
    this.branchId,
    this.descriptionProduct,
    this.descriptionStep,
    this.lat,
    this.long,
    this.orderModifiers,
    this.price,
    this.productId,
    this.quantity,
    this.type,
    this.variants,
  });
  @HiveField(0)
  String? apartment;
  @HiveField(1)
  String? building;
  @HiveField(2)
  String? clientId;
  @HiveField(3)
  int? coDeliveryPrice;
  @HiveField(4)
  String? deliveryTime;
  @HiveField(5)
  String? deliveryType;
  @HiveField(6)
  String? description;
  @HiveField(7)
  bool? isCourierCall;
  @HiveField(8)
  String? extraPhoneNumber;
  @HiveField(9)
  String? floor;
  @HiveField(10)
  bool? paid;
  @HiveField(11)
  String? paymentType;
  @HiveField(12)
  String? source;
  @HiveField(13)
  String? statusId;
  @HiveField(14)
  String? toAddress;
  @HiveField(15)
  dynamic futureTime;
  @HiveField(16)
  String? branchId;
  @HiveField(17)
  String? descriptionStep;
  @HiveField(18)
  String? descriptionProduct;
  @HiveField(19)
  String? type;
  @HiveField(20)
  String? price;
  @HiveField(21)
  String? productId;
  @HiveField(22)
  int? quantity;
  @HiveField(23)
  List<dynamic>? orderModifiers;
  @HiveField(24)
  List<dynamic>? variants;
  @HiveField(25)
  double? lat;
  @HiveField(26)
  double? long;

  
  OrderDatasModel copyWith({
    String? apartment, //kvartira 1
    String? building, //podezd 1
    String? clientId,
    int? coDeliveryPrice,
    String? deliveryTime,
    String? deliveryType,
    String? description,
    bool? isCourierCall,
    String? extraPhoneNumber,
    String? floor, //qavat
    bool? paid,
    String? paymentType,
    String? source,
    String? statusId,
    String? toAddress,
    dynamic futureTime,
    String? branchId,
    String? descriptionStep,
    String? descriptionProduct,
    String? type,
    String? price,
    String? productId,
    int? quantity,
    List<dynamic>? orderModifiers,
    List<dynamic>? variants,
    double? lat,
    double? long,
  }) {
    return OrderDatasModel(
      apartment: apartment ?? this.apartment,
      branchId: branchId ?? this.branchId,
      building: building ?? this.building,
      clientId: clientId ?? this.clientId,
      coDeliveryPrice: coDeliveryPrice ?? this.coDeliveryPrice,
      deliveryTime: deliveryTime ?? this.deliveryTime,
      deliveryType: deliveryType ?? this.deliveryType,
      description: description ?? this.description,
      descriptionProduct: descriptionProduct ?? this.descriptionProduct,
      descriptionStep: descriptionStep ?? this.descriptionStep,
      floor: floor ?? this.floor,
      extraPhoneNumber: extraPhoneNumber ?? this.extraPhoneNumber,
      futureTime: futureTime ?? this.futureTime,
      isCourierCall: isCourierCall ?? this.isCourierCall,
      lat: lat ?? this.lat,
      long: long ?? this.long,
      orderModifiers: orderModifiers ?? this.orderModifiers,
      paid: paid ?? this.paid,
      paymentType: paymentType ?? this.paymentType,
      price: price ?? this.price,
      productId: productId ?? this.productId,
      quantity: quantity ?? this.quantity,
      source: source ?? this.source,
      statusId: statusId ?? this.statusId,
      toAddress: toAddress ?? this.toAddress,
      type: type ?? this.type,
      variants: variants ?? this.variants,
    );
  }
}
