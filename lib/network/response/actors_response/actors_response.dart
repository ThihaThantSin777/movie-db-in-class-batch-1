import 'package:json_annotation/json_annotation.dart';

import '../../../data/vos/result_vo/result_vo.dart';
part 'actors_response.g.dart';

@JsonSerializable()
class ActorsResponse {

  @JsonKey(name: 'page')
  int? page;

  @JsonKey(name: 'results')
  List<ResultsVO>? results;

  @JsonKey(name: 'total_pages')
  int? totalPages;

  @JsonKey(name: 'total_results')
  int? totalResults;

  ActorsResponse({this.page, this.results, this.totalPages, this.totalResults});

 factory ActorsResponse.fromJson(Map<String, dynamic> json) => _$ActorsResponseFromJson(json);

  Map<String, dynamic> toJson() =>_$ActorsResponseToJson(this);
}
