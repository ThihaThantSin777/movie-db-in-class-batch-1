import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_db/data/vos/genres_vo/genres_vo.dart';
import 'package:movie_db/data/vos/production_companies_vo/production_companies_vo.dart';
import 'package:movie_db/data/vos/production_countries_vo/production_countries_vo.dart';
import 'package:movie_db/data/vos/spoken_language_vo/spoken_language_vo.dart';

import '../../../constant/persistent_constant.dart';
import '../../../data/vos/belongtoCollection_vo/belongtoCollection_vo.dart';

part 'movie_details_response.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveMovieDetailsType)
class MovieDetailsResponse {

  @HiveField(0)
  @JsonKey(name: 'adult')
  bool? adult;

  @HiveField(1)
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;

  @HiveField(2)
  @JsonKey(name: 'belongs_to_collection')
  BelongsToCollectionVO? belongsToCollection;

  @HiveField(3)
  @JsonKey(name: 'budget')
  int? budget;

  @HiveField(4)
  @JsonKey(name: 'genres')
  List<GenresVO>? genres;

  @HiveField(5)
  @JsonKey(name: 'homepage')
  String? homepage;

  @HiveField(6)
  @JsonKey(name: 'id')
  int? id;

  @HiveField(7)
  @JsonKey(name: 'imdb_id')
  String? imdbId;

  @HiveField(8)
  @JsonKey(name: 'original_language')
  String? originalLanguage;

  @HiveField(9)
  @JsonKey(name: 'original_title')
  String? originalTitle;

  @HiveField(10)
  @JsonKey(name: 'overview')
  String? overview;

  @HiveField(11)
  @JsonKey(name: 'popularity')
  double? popularity;

  @HiveField(12)
  @JsonKey(name: 'poster_path')
  String? posterPath;

  @HiveField(13)
  @JsonKey(name: 'production_companies')
  List<ProductionCompaniesVO>? productionCompanies;

  @HiveField(14)
  @JsonKey(name: 'production_countries')
  List<ProductionCountriesVO>? productionCountries;

  @HiveField(15)
  @JsonKey(name: 'release_date')
  String? releaseDate;

  @HiveField(16)
  @JsonKey(name: 'revenue')
  int? revenue;

  @HiveField(17)
  @JsonKey(name: 'runtime')
  int? runtime;

  @HiveField(18)
  @JsonKey(name: 'spoken_languages')
  List<SpokenLanguagesVO>? spokenLanguages;

  @HiveField(19)
  @JsonKey(name: 'status')
  String? status;

  @HiveField(20)
  @JsonKey(name: 'tagline')
  String? tagline;

  @HiveField(21)
  @JsonKey(name: 'title')
  String? title;

  @HiveField(22)
  @JsonKey(name: 'video')
  bool? video;

  @HiveField(23)
  @JsonKey(name: 'vote_average')
  double? voteAverage;

  @HiveField(24)
  @JsonKey(name: 'vote_count')
  int? voteCount;

  MovieDetailsResponse({this.adult,
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

  factory MovieDetailsResponse.fromJson(Map<String,dynamic> json)=>_$MovieDetailsResponseFromJson(json);
  Map<String,dynamic> toJson()=>_$MovieDetailsResponseToJson(this);

}