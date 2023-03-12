import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../constant/persistent_constant.dart';
import '../known_for_vo/known_for_vo.dart';
part 'result_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveActorsType)
class ResultsVO {

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
  @JsonKey(name: 'known_for')
  List<KnownForVO>? knownFor;

  @HiveField(4)
  @JsonKey(name: 'known_for_department')
  String? knownForDepartment;

  @HiveField(5)
  @JsonKey(name: 'name')
  String? name;

  @HiveField(6)
  @JsonKey(name: 'popularity')
  double? popularity;

  @HiveField(7)
  @JsonKey(name: 'profile_path')
  String? profilePath;

  ResultsVO(
      {this.adult,
        this.gender,
        this.id,
        this.knownFor,
        this.knownForDepartment,
        this.name,
        this.popularity,
        this.profilePath});

 factory ResultsVO.fromJson(Map<String, dynamic> json) =>_$ResultsVOFromJson(json);

  Map<String, dynamic> toJson() => _$ResultsVOToJson(this);
}

