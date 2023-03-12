// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dates_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DatesVOAdapter extends TypeAdapter<DatesVO> {
  @override
  final int typeId = 12;

  @override
  DatesVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DatesVO(
      fields[0] as String?,
      fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, DatesVO obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.maximum)
      ..writeByte(1)
      ..write(obj.minimum);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DatesVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DatesVO _$DatesVOFromJson(Map<String, dynamic> json) => DatesVO(
      json['maximum'] as String?,
      json['minimum'] as String?,
    );

Map<String, dynamic> _$DatesVOToJson(DatesVO instance) => <String, dynamic>{
      'maximum': instance.maximum,
      'minimum': instance.minimum,
    };
