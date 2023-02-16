import 'package:json_annotation/json_annotation.dart';

import '../../../data/vos/actor_vo/actor_vo.dart';
part 'actor_response.g.dart';
@JsonSerializable()
class ActorResponse{
  @JsonKey(name: 'page')
  int? page;
  @JsonKey(name: 'results')
  List<ActorVO>? results;
  @JsonKey(name: 'total_pages')
  int? totalPages;
  @JsonKey(name: 'total_results')
  int? totalResult;

  ActorResponse(this.page, this.results, this.totalPages, this.totalResult);
  factory ActorResponse.fromJson(Map<String,dynamic> json) => _$ActorResponseFromJson(json);
}