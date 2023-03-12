import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_db/data/vos/credits_vo/cast_vo/cast_vo.dart';

import '../../../constant/persistent_constant.dart';
import '../../../data/vos/credits_vo/crew_vo/crew_vo.dart';
part 'credits_response.g.dart';
@HiveType(typeId: kHiveCreditsResponse)
@JsonSerializable()
class CreditsResponse {
  @HiveField(0)
  @JsonKey(name: 'id')
  int? id;

  @HiveField(1)
  @JsonKey(name: 'cast')
  List<CastVO>? cast;

  @HiveField(2)
  @JsonKey(name: 'crew')
  List<CrewVO>? crew;

  CreditsResponse({this.id, this.cast, this.crew});

  factory CreditsResponse.fromJson(Map<String, dynamic> json) =>_$CreditsResponseFromJson(json);

 Map<String, dynamic> toJson() =>_$CreditsResponseToJson(this);
}