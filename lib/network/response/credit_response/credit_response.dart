import 'package:json_annotation/json_annotation.dart';

import '../../../data/vos/credit_vo/cast_vo.dart';
import '../../../data/vos/credit_vo/crew_vo.dart';
part 'credit_response.g.dart';
@JsonSerializable()
class CastAndCrewResponse{
  @JsonKey(name: "id")
  int ? id;
  @JsonKey(name: "cast")
  List<CastVO>? castList;
  @JsonKey(name: "crew")
  List<CrewVO>? crewList;

  CastAndCrewResponse(this.id, this.castList, this.crewList);
  factory CastAndCrewResponse.fromJson(Map<String,dynamic> json)=>
      _$CastAndCrewResponseFromJson(json);
}