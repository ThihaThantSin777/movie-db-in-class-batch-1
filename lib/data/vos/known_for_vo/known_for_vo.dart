import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../constant/persistent_constant.dart';
part 'known_for_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveActorsKnownForType)
class KnownForVO {

  @HiveField(0)
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;

  @HiveField(1)
  @JsonKey(name: 'first_air_date')
  String? firstAirDate;

  @HiveField(2)
  @JsonKey(name: 'genre_ids')
  List<int>? genreIds;

  @HiveField(3)
  @JsonKey(name: 'id')
  int? id;

  @HiveField(4)
  @JsonKey(name: 'media_type')
  String? mediaType;

  @HiveField(5)
  @JsonKey(name: 'name')
  String? name;

  @HiveField(6)
  @JsonKey(name: 'origin_country')
  List<String>? originCountry;

  @HiveField(7)
  @JsonKey(name: 'original_language')
  String? originalLanguage;

  @HiveField(8)
  @JsonKey(name: 'original_name')
  String? originalName;

  @HiveField(9)
  @JsonKey(name: 'overview')
  String? overview;

  @HiveField(10)
  @JsonKey(name: 'poster_path')
  String? posterPath;

  @HiveField(11)
  @JsonKey(name: 'vote_average')
  double? voteAverage;

  @HiveField(12)
  @JsonKey(name: 'vote_count')
  int? voteCount;

  @HiveField(13)
  @JsonKey(name: 'adult')
  bool? adult;

  @HiveField(14)
  @JsonKey(name: 'original_title')
  String? originalTitle;

  @HiveField(15)
  @JsonKey(name: 'release_date')
  String? releaseDate;

  @HiveField(16)
  @JsonKey(name: 'title')
  String? title;

  @HiveField(17)
  @JsonKey(name: 'video')
  bool? video;

  KnownForVO(
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
        this.adult,
        this.originalTitle,
        this.releaseDate,
        this.title,
        this.video);

 factory KnownForVO.fromJson(Map<String, dynamic> json) =>_$KnownForVOFromJson(json);

  Map<String, dynamic> toJson() =>_$KnownForVOToJson(this);
}
