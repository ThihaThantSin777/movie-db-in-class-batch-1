import 'package:json_annotation/json_annotation.dart';
import 'package:movie_db/data/vos/details_vo/production_company_vo/production_vo.dart';
import 'package:movie_db/data/vos/details_vo/production_country_vo/production_country_vo.dart';
import 'package:movie_db/data/vos/details_vo/spoken_languages/spoken_languages.dart';
import 'collections_vo/collections_vo.dart';
import 'genre_vo/genre_vo.dart';

part 'details_vo.g.dart';

@JsonSerializable()
class DetailsVO {
  @JsonKey(name: 'adult')
  bool? adult;

  @JsonKey(name: 'backdrop_path')
  String? backdropPath;

  @JsonKey(name: 'belongs_to_collection')
  BelongsToCollection? belongsToCollection;

  @JsonKey(name: 'budget')
  int? budget;

  @JsonKey(name: 'genres')
  List<GenreVO>? genres;

  @JsonKey(name: 'homepage')
  String? homepage;

  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'imdb_id')
  String? imdbId;

  @JsonKey(name: 'original_language')
  String? originalLanguage;

  @JsonKey(name: 'original_title')
  String? originalTitle;

  @JsonKey(name: 'overview')
  String? overview;

  @JsonKey(name: 'popularity')
  double? popularity;

  @JsonKey(name: 'poster_path')
  String? posterPath;

  @JsonKey(name: 'production_companies')
  List<ProductionCompanies>? productionCompanies;

  @JsonKey(name: 'production_countries')
  List<ProductionCountryVO>? productionCountries;

  @JsonKey(name: 'release_date')
  String? releaseDate;

  @JsonKey(name: 'revenue')
  int? revenue;

  @JsonKey(name: 'runtime')
  int? runtime;

  @JsonKey(name: 'spoken_languages')
  List<SpokenLanguagesVO>? spokenLanguages;

  @JsonKey(name: 'status')
  String? status;

  @JsonKey(name: 'tagline')
  String? tagline;

  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'video')
  bool? video;

  @JsonKey(name: 'vote_average')
  double? voteAverage;

  @JsonKey(name: 'vote_count')
  int? voteCount;

  DetailsVO(
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

  factory DetailsVO.fromJson(Map<String, dynamic> json) =>
      _$DetailsVOFromJson(json);
}
