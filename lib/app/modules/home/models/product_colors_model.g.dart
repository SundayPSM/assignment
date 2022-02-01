// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_colors_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductColorsAdapter extends TypeAdapter<ProductColors> {
  @override
  final int typeId = 2;

  @override
  ProductColors read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductColors(
      hexValue: fields[0] as String?,
      colourName: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ProductColors obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.hexValue)
      ..writeByte(1)
      ..write(obj.colourName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductColorsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
