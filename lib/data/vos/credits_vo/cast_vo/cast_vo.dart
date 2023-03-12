import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../constant/persistent_constant.dart';
part 'cast_vo.g.dart';
@JsonSerializable()
@HiveType(typeId: kHiveCastVOType)
class CastVO {

  @HiveField(0)
  @JsonKey(name: 'adult')
  bool? adult;

  @HiveField(1)
  @JsonKey(name: 'gender')
  int? gender;

  @HiveField(2)
  @JsonKey(name: 'id')
  int? id;

  @HiveField(3)
  @JsonKey(name: 'known_for_department')
  String? knownForDepartment;

  @HiveField(4)
  @JsonKey(name: 'name')
  String? name;

  @HiveField(5)
  @JsonKey(name: 'original_name')
  String? originalName;

  @HiveField(6)
  @JsonKey(name: 'popularity')
  double? popularity;

  @HiveField(7)
  @JsonKey(name: 'profile_path')
  String? profilePath;

  @HiveField(8)
  @JsonKey(name: 'cast_id')
  int? castId;

  @HiveField(9)
  @JsonKey(name: 'character')
  String? character;

  @HiveField(10)
  @JsonKey(name: 'credit_id')
  String? creditId;

  @HiveField(11)
  @JsonKey(name: 'order')
  int? order;

  CastVO(
      {this.adult,
        this.gender,
        this.id,
        this.knownForDepartment,
        this.name,
        this.originalName,
        this.popularity,
        this.profilePath,
        this.castId,
        this.character,
        this.creditId,
        this.order});

  factory CastVO.fromJson(Map<String, dynamic> json) =>_$CastVOFromJson(json);
  Map<String, dynamic> toJson() =>_$CastVOToJson(this);
}
