import 'package:json_annotation/json_annotation.dart';

part 'know_for_vo.g.dart';

@JsonSerializable()
class KnowForVO {
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;

  @JsonKey(name: 'first_air_date')
  String? firstAirDate;

  @JsonKey(name: 'genre_ids')
  List<int>? genreIds;

  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'media_type')
  String? mediaType;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'origin_country')
  List<String>? originCountry;

  @JsonKey(name: 'original_language')
  String? originalLanguage;

  @JsonKey(name: 'original_name')
  String? originalName;

  @JsonKey(name: 'overview')
  String? overview;

  @JsonKey(name: 'poster_path')
  String? posterPath;

  @JsonKey(name: 'vote_average')
  num? voteAverage;

  @JsonKey(name: 'vote_count')
  int? voteCount;

  KnowForVO(
    this.backdropPath,
    this.firstAirDate,
    this.genreIds,
    this.id,
    this.mediaType,
    this.name,
    this.originCountry,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.posterPath,
    this.voteAverage,
    this.voteCount,
  );

  factory KnowForVO.fromJson(Map<String, dynamic> json) =>
      _$KnowForVOFromJson(json);
}
