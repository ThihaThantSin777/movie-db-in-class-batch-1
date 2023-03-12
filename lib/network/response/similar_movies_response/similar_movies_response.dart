import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../data/vos/movie_vo/movie_vo.dart';
import '../../../data/vos/result_vo/result_vo.dart';
part 'similar_movies_response.g.dart';
@JsonSerializable()
class SimilarMoviesResponse {
  @JsonKey(name: 'page')
  int? page;

  @JsonKey(name: 'results')
  List<MovieVO>? results;

  @JsonKey(name: 'total_pages')
  int? totalPages;

  @JsonKey(name: 'total_results')
  int? totalResults;

  SimilarMoviesResponse(
      {this.page, this.results, this.totalPages, this.totalResults});

  factory SimilarMoviesResponse.fromJson(Map<String, dynamic> json)=>_$SimilarMoviesResponseFromJson(json);

  Map<String, dynamic> toJson()=>_$SimilarMoviesResponseToJson(this);
}
