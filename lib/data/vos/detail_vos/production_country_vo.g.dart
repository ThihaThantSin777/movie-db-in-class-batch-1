// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'production_country_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductionCountriesAdapter extends TypeAdapter<ProductionCountries> {
  @override
  final int typeId = 5;

  @override
  ProductionCountries read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductionCountries(
      iso31661: fields[0] as String?,
      name: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ProductionCountries obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.iso31661)
      ..writeByte(1)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductionCountriesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductionCountries _$ProductionCountriesFromJson(Map<String, dynamic> json) =>
    ProductionCountries(
      iso31661: json['iso_3166_1'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$ProductionCountriesToJson(
        ProductionCountries instance) =>
    <String, dynamic>{
      'iso_3166_1': instance.iso31661,
      'name': instance.name,
    };
