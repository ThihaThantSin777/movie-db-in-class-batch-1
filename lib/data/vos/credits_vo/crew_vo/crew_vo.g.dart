// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crew_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CrewVOAdapter extends TypeAdapter<CrewVO> {
  @override
  final int typeId = 11;

  @override
  CrewVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CrewVO(
      adult: fields[0] as bool?,
      gender: fields[1] as int?,
      id: fields[2] as int?,
      knownForDepartment: fields[3] as String?,
      name: fields[4] as String?,
      originalName: fields[5] as String?,
      popularity: fields[6] as double?,
      profilePath: fields[7] as String?,
      creditId: fields[8] as String?,
      department: fields[9] as String?,
      job: fields[10] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CrewVO obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.adult)
      ..writeByte(1)
      ..write(obj.gender)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.knownForDepartment)
      ..writeByte(4)
      ..write(obj.name)
      ..writeByte(5)
      ..write(obj.originalName)
      ..writeByte(6)
      ..write(obj.popularity)
      ..writeByte(7)
      ..write(obj.profilePath)
      ..writeByte(8)
      ..write(obj.creditId)
      ..writeByte(9)
      ..write(obj.department)
      ..writeByte(10)
      ..write(obj.job);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CrewVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CrewVO _$CrewVOFromJson(Map<String, dynamic> json) => CrewVO(
      adult: json['adult'] as bool?,
      gender: json['gender'] as int?,
      id: json['id'] as int?,
      knownForDepartment: json['known_for_department'] as String?,
      name: json['name'] as String?,
      originalName: json['original_name'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      profilePath: json['profile_path'] as String?,
      creditId: json['credit_id'] as String?,
      department: json['department'] as String?,
      job: json['job'] as String?,
    );

Map<String, dynamic> _$CrewVOToJson(CrewVO instance) => <String, dynamic>{
      'adult': instance.adult,
      'gender': instance.gender,
      'id': instance.id,
      'known_for_department': instance.knownForDepartment,
      'name': instance.name,
      'original_name': instance.originalName,
      'popularity': instance.popularity,
      'profile_path': instance.profilePath,
      'credit_id': instance.creditId,
      'department': instance.department,
      'job': instance.job,
    };
