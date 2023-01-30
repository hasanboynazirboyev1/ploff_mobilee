// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_datas_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrderDatasModelAdapter extends TypeAdapter<OrderDatasModel> {
  @override
  final int typeId = 1;

  @override
  OrderDatasModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrderDatasModel(
      apartment: fields[0] as String?,
      building: fields[1] as String?,
      clientId: fields[2] as String?,
      coDeliveryPrice: fields[3] as int?,
      deliveryTime: fields[4] as String?,
      deliveryType: fields[5] as String?,
      description: fields[6] as String?,
      isCourierCall: fields[7] as bool?,
      extraPhoneNumber: fields[8] as String?,
      floor: fields[9] as String?,
      paid: fields[10] as bool?,
      paymentType: fields[11] as String?,
      source: fields[12] as String?,
      statusId: fields[13] as String?,
      toAddress: fields[14] as String?,
      futureTime: fields[15] as dynamic,
      branchId: fields[16] as String?,
      descriptionProduct: fields[18] as String?,
      descriptionStep: fields[17] as String?,
      lat: fields[25] as double?,
      long: fields[26] as double?,
      orderModifiers: (fields[23] as List?)?.cast<dynamic>(),
      price: fields[20] as String?,
      productId: fields[21] as String?,
      quantity: fields[22] as int?,
      type: fields[19] as String?,
      variants: (fields[24] as List?)?.cast<dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, OrderDatasModel obj) {
    writer
      ..writeByte(27)
      ..writeByte(0)
      ..write(obj.apartment)
      ..writeByte(1)
      ..write(obj.building)
      ..writeByte(2)
      ..write(obj.clientId)
      ..writeByte(3)
      ..write(obj.coDeliveryPrice)
      ..writeByte(4)
      ..write(obj.deliveryTime)
      ..writeByte(5)
      ..write(obj.deliveryType)
      ..writeByte(6)
      ..write(obj.description)
      ..writeByte(7)
      ..write(obj.isCourierCall)
      ..writeByte(8)
      ..write(obj.extraPhoneNumber)
      ..writeByte(9)
      ..write(obj.floor)
      ..writeByte(10)
      ..write(obj.paid)
      ..writeByte(11)
      ..write(obj.paymentType)
      ..writeByte(12)
      ..write(obj.source)
      ..writeByte(13)
      ..write(obj.statusId)
      ..writeByte(14)
      ..write(obj.toAddress)
      ..writeByte(15)
      ..write(obj.futureTime)
      ..writeByte(16)
      ..write(obj.branchId)
      ..writeByte(17)
      ..write(obj.descriptionStep)
      ..writeByte(18)
      ..write(obj.descriptionProduct)
      ..writeByte(19)
      ..write(obj.type)
      ..writeByte(20)
      ..write(obj.price)
      ..writeByte(21)
      ..write(obj.productId)
      ..writeByte(22)
      ..write(obj.quantity)
      ..writeByte(23)
      ..write(obj.orderModifiers)
      ..writeByte(24)
      ..write(obj.variants)
      ..writeByte(25)
      ..write(obj.lat)
      ..writeByte(26)
      ..write(obj.long);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderDatasModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
