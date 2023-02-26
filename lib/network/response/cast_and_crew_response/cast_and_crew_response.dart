import 'package:json_annotation/json_annotation.dart';
import '../../../data/vos/cast_and_crews_vo/cast_vo/cast_vo.dart';
import '../../../data/vos/cast_and_crews_vo/crew_vo/crew_vo.dart';
part 'cast_and_crew_response.g.dart';

@JsonSerializable()
class CastAndCrewResponse {
  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'cast')
  List<CastVO>? cast;

  @JsonKey(name: 'crew')
  List<CrewVO>? crew;

  CastAndCrewResponse(this.id, this.cast, this.crew);

  factory CastAndCrewResponse.fromJson(Map<String, dynamic> json) =>
      _$CastAndCrewResponseFromJson(json);
}
