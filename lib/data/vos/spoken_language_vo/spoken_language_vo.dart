import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../constant/persistent_constant.dart';

part 'spoken_language_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveSpokenLanguagesVOType)
class SpokenLanguagesVO {

  @HiveField(0)
  @JsonKey(name: 'english_name')
  String? englishName;

  @HiveField(1)
  @JsonKey(name: 'iso_639_1')
  String? iso6391;

  @HiveField(2)
  @JsonKey(name: 'name')
  String? name;

  SpokenLanguagesVO({this.englishName, this.iso6391, this.name});

 factory SpokenLanguagesVO.fromJson(Map<String, dynamic> json) =>_$SpokenLanguagesVOFromJson(json);

  Map<String, dynamic> toJson() =>_$SpokenLanguagesVOToJson(this);
}