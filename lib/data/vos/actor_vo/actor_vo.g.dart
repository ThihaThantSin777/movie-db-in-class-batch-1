// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actor_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActorVO _$ActorVOFromJson(Map<String, dynamic> json) => ActorVO(
      json['adult'] as bool?,
      json['gender'] as int?,
      json['id'] as int?,
      (json['know_for'] as List<dynamic>?)
          ?.map((e) => KnowForVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['know_for_department'] as String?,
      json['name'] as String?,
      json['popularity'] as num?,
      json['profile_path'] as String?,
    );

Map<String, dynamic> _$ActorVOToJson(ActorVO instance) => <String, dynamic>{
      'adult': instance.adult,
      'gender': instance.gender,
      'id': instance.id,
      'know_for': instance.knowFor,
      'know_for_department': instance.knowForDepartment,
      'name': instance.name,
      'popularity': instance.popularity,
      'profile_path': instance.profilePath,
    };
