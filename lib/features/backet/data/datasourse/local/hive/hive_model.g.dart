// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OneProductModelHiveAdapter extends TypeAdapter<OneProductModelHive> {
  @override
  final int typeId = 0;

  @override
  OneProductModelHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OneProductModelHive(
      id: fields[0] as String,
      slug: fields[1] as String,
      title: fields[2] as String,
      code: fields[3] as String,
      description: fields[4] as String,
      brand: fields[5] as dynamic,
      isDivisible: fields[6] as bool,
      count: fields[7] as String,
      tags: (fields[8] as List).cast<dynamic>(),
      measurement: fields[9] as dynamic,
      rate: fields[10] as dynamic,
      inPrice: fields[11] as int,
      outPrice: fields[12] as int,
      image: fields[13] as String,
      gallery: (fields[14] as List).cast<dynamic>(),
      favourites: (fields[15] as List).cast<dynamic>(),
      active: fields[16] as bool,
      order: fields[17] as String,
      createdAt: fields[18] as String,
      iikoId: fields[19] as String,
      jowiId: fields[20] as String,
      shipperId: fields[21] as String,
      priceChangers: (fields[22] as List).cast<dynamic>(),
      currency: fields[23] as String,
      type: fields[24] as String,
      properties: (fields[25] as List).cast<dynamic>(),
      productProperty: (fields[26] as List).cast<dynamic>(),
      iikoSourceActionId: fields[27] as String,
      iikoGroupId: fields[28] as String,
      activeInMenu: fields[29] as bool,
      offAlways: fields[30] as bool,
      fromTime: fields[31] as String,
      toTime: fields[32] as String,
      ikpu: fields[33] as String,
      packageCode: fields[34] as String,
      variantProducts: (fields[35] as List).cast<dynamic>(),
      parentId: fields[36] as String,
      hasModifier: fields[38] as bool,
      rkeeperId: fields[39] as String,
    );
  }

  @override
  void write(BinaryWriter writer, OneProductModelHive obj) {
    writer
      ..writeByte(39)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.slug)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.code)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.brand)
      ..writeByte(6)
      ..write(obj.isDivisible)
      ..writeByte(7)
      ..write(obj.count)
      ..writeByte(8)
      ..write(obj.tags)
      ..writeByte(9)
      ..write(obj.measurement)
      ..writeByte(10)
      ..write(obj.rate)
      ..writeByte(11)
      ..write(obj.inPrice)
      ..writeByte(12)
      ..write(obj.outPrice)
      ..writeByte(13)
      ..write(obj.image)
      ..writeByte(14)
      ..write(obj.gallery)
      ..writeByte(15)
      ..write(obj.favourites)
      ..writeByte(16)
      ..write(obj.active)
      ..writeByte(17)
      ..write(obj.order)
      ..writeByte(18)
      ..write(obj.createdAt)
      ..writeByte(19)
      ..write(obj.iikoId)
      ..writeByte(20)
      ..write(obj.jowiId)
      ..writeByte(21)
      ..write(obj.shipperId)
      ..writeByte(22)
      ..write(obj.priceChangers)
      ..writeByte(23)
      ..write(obj.currency)
      ..writeByte(24)
      ..write(obj.type)
      ..writeByte(25)
      ..write(obj.properties)
      ..writeByte(26)
      ..write(obj.productProperty)
      ..writeByte(27)
      ..write(obj.iikoSourceActionId)
      ..writeByte(28)
      ..write(obj.iikoGroupId)
      ..writeByte(29)
      ..write(obj.activeInMenu)
      ..writeByte(30)
      ..write(obj.offAlways)
      ..writeByte(31)
      ..write(obj.fromTime)
      ..writeByte(32)
      ..write(obj.toTime)
      ..writeByte(33)
      ..write(obj.ikpu)
      ..writeByte(34)
      ..write(obj.packageCode)
      ..writeByte(35)
      ..write(obj.variantProducts)
      ..writeByte(36)
      ..write(obj.parentId)
      ..writeByte(38)
      ..write(obj.hasModifier)
      ..writeByte(39)
      ..write(obj.rkeeperId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OneProductModelHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
