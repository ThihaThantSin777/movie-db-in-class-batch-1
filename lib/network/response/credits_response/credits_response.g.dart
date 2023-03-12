// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credits_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CreditsResponseAdapter extends TypeAdapter<CreditsResponse> {
  @override
  final int typeId = 13;

  @override
  CreditsResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CreditsResponse(
      id: fields[0] as int?,
      cast: (fields[1] as List?)?.cast<CastVO>(),
      crew: (fields[2] as List?)?.cast<CrewVO>(),
    );
  }

  @override
  void write(BinaryWriter writer, CreditsResponse obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.cast)
      ..writeByte(2)
      ..write(obj.crew);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreditsResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreditsResponse _$CreditsResponseFromJson(Map<String, dynamic> json) =>
    CreditsResponse(
      id: json['id'] as int?,
      cast: (json['cast'] as List<dynamic>?)
          ?.map((e) => CastVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      crew: (json['crew'] as List<dynamic>?)
          ?.map((e) => CrewVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CreditsResponseToJson(CreditsResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cast': instance.cast,
      'crew': instance.crew,
    };
