// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'know_for_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KnowForVO _$KnowForVOFromJson(Map<String, dynamic> json) => KnowForVO(
      json['backdrop_path'] as String?,
      json['first_air_date'] as String?,
      (json['genre_ids'] as List<dynamic>?)?.map((e) => e as int).toList(),
      json['id'] as int?,
      json['media_type'] as String?,
      json['name'] as String?,
      (json['original_country'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      json['original_language'] as String?,
      json['original_name'] as String?,
      json['overview'] as String?,
      json['poster_path'] as String?,
      json['vote_average'] as num?,
      json['vote_count'] as num?,
    );

Map<String, dynamic> _$KnowForVOToJson(KnowForVO instance) => <String, dynamic>{
      'backdrop_path': instance.backdropPath,
      'first_air_date': instance.firstAirDate,
      'genre_ids': instance.genreIds,
      'id': instance.id,
      'media_type': instance.mediaType,
      'name': instance.name,
      'original_country': instance.originalCountry,
      'original_language': instance.originalLanguage,
      'original_name': instance.originalName,
      'overview': instance.overView,
      'poster_path': instance.posterPath,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
    };
