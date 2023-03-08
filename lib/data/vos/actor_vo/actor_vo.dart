import 'package:json_annotation/json_annotation.dart';

import '../know_for_vo/know_for_vo.dart';
part 'actor_vo.g.dart';
@JsonSerializable()
class ActorVO{
  @JsonKey(name: 'adult')
  bool? adult;
  @JsonKey(name: 'gender')
  int? gender;
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'know_for')
  List<KnowForVO>? knowFor;
  @JsonKey(name: 'know_for_department')
  String? knowForDepartment;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'popularity')
  num? popularity;
  @JsonKey(name: 'profile_path')
  String? profilePath;

  ActorVO(this.adult, this.gender, this.id, this.knowFor,
      this.knowForDepartment, this.name, this.popularity, this.profilePath);
  factory ActorVO.fromJson(Map<String,dynamic> json) => _$ActorVOFromJson(json);
}