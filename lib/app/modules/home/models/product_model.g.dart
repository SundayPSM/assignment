// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductAdapter extends TypeAdapter<Product> {
  @override
  final int typeId = 1;

  @override
  Product read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Product(
      id: fields[0] as int?,
      brand: fields[1] as String?,
      name: fields[2] as String?,
      price: fields[3] as String?,
      priceSign: fields[4] as String?,
      currency: fields[5] as String?,
      imageLink: fields[6] as String?,
      productLink: fields[7] as String?,
      websiteLink: fields[8] as String?,
      description: fields[9] as String?,
      rating: fields[10] as dynamic,
      category: fields[11] as String?,
      productType: fields[12] as String?,
      tagList: (fields[13] as List?)?.cast<String>(),
      createdAt: fields[14] as String?,
      updatedAt: fields[15] as String?,
      productApiUrl: fields[16] as String?,
      apiFeaturedImage: fields[17] as String?,
      productColors: (fields[18] as List?)?.cast<ProductColors>(),
    );
  }

  @override
  void write(BinaryWriter writer, Product obj) {
    writer
      ..writeByte(19)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.brand)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.priceSign)
      ..writeByte(5)
      ..write(obj.currency)
      ..writeByte(6)
      ..write(obj.imageLink)
      ..writeByte(7)
      ..write(obj.productLink)
      ..writeByte(8)
      ..write(obj.websiteLink)
      ..writeByte(9)
      ..write(obj.description)
      ..writeByte(10)
      ..write(obj.rating)
      ..writeByte(11)
      ..write(obj.category)
      ..writeByte(12)
      ..write(obj.productType)
      ..writeByte(13)
      ..write(obj.tagList)
      ..writeByte(14)
      ..write(obj.createdAt)
      ..writeByte(15)
      ..write(obj.updatedAt)
      ..writeByte(16)
      ..write(obj.productApiUrl)
      ..writeByte(17)
      ..write(obj.apiFeaturedImage)
      ..writeByte(18)
      ..write(obj.productColors);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
