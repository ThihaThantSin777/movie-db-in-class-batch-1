import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_db/constant/dao_constant.dart';

import '../../../data/vos/detail_vos/belong_to_vo.dart';
import '../../../data/vos/detail_vos/production_company_vo.dart';
import '../../../data/vos/detail_vos/production_country_vo.dart';
import '../../../data/vos/detail_vos/spoken_language_vo.dart';
import '../../../data/vos/genre_vo/genre_vo.dart';

part 'detail_response.g.dart';
@JsonSerializable()
@HiveType(typeId: kDetailTypeId)
class DetailResponse {
  @JsonKey(name: 'adult')
  @HiveField(0)
  bool? adult;

  @JsonKey(name: 'backdrop_path')
  @HiveField(1)
  String? backdropPath;

  @JsonKey(name: 'belongs_to_collection')
  @HiveField(2)
  BelongsToCollection? belongsToCollection;

  @JsonKey(name: 'budget')
  @HiveField(3)
  int? budget;

  @JsonKey(name: 'genres')
  @HiveField(4)
  List<GenreVO>? genres;

  @HiveField(5)
  @JsonKey(name: 'homepage')
  String? homepage;

  @JsonKey(name: 'id')
  @HiveField(6)
  int? id;

  @JsonKey(name: 'imdb_id')
  @HiveField(7)
  String? imdbId;

  @JsonKey(name: 'original_language')
  @HiveField(8)
  String? originalLanguage;

  @JsonKey(name: 'original_title')
  @HiveField(9)
  String? originalTitle;

  @JsonKey(name: 'overview')
  @HiveField(10)
  String? overview;

  @JsonKey(name: 'popularity')
  @HiveField(11)
  double? popularity;

  @JsonKey(name: 'poster_path')
  @HiveField(12)
  String? posterPath;

  @JsonKey(name: 'production_companies')
  @HiveField(13)
  List<ProductionCompanies>? productionCompanies;

  @JsonKey(name: 'production_countries')
  @HiveField(14)
  List<ProductionCountries>? productionCountries;

  @JsonKey(name: 'release_date')
  @HiveField(15)
  String? releaseDate;

  @JsonKey(name: 'revenue')
  @HiveField(16)
  int? revenue;

  @JsonKey(name: 'runtime')
  @HiveField(17)
  int? runtime;

  @HiveField(18)
  @JsonKey(name: 'spoken_languages')
  List<SpokenLanguages>? spokenLanguages;

  @JsonKey(name: 'status')
  @HiveField(19)
  String? status;

  @JsonKey(name: 'tagline')
  @HiveField(20)
  String? tagline;

  @JsonKey(name: 'title')
  @HiveField(21)
  String? title;

  @JsonKey(name: 'video')
  @HiveField(22)
  bool? video;

  @JsonKey(name: 'vote_average')
  @HiveField(23)
  double? voteAverage;

  @JsonKey(name: 'vote_count')
  @HiveField(24)
  int? voteCount;

  DetailResponse(
      {this.adult,
        this.backdropPath,
        this.belongsToCollection,
        this.budget,
        this.genres,
        this.homepage,
        this.id,
        this.imdbId,
        this.originalLanguage,
        this.originalTitle,
        this.overview,
        this.popularity,
        this.posterPath,
        this.productionCompanies,
        this.productionCountries,
        this.releaseDate,
        this.revenue,
        this.runtime,
        this.spokenLanguages,
        this.status,
        this.tagline,
        this.title,
        this.video,
        this.voteAverage,
        this.voteCount});

  factory DetailResponse.fromJson(Map<String, dynamic> json)=> _$DetailResponseFromJson(json);
}