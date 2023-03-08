import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_db/constant/dao_constant.dart';
part 'spoken_language_vo.g.dart';
@JsonSerializable()
@HiveType(typeId: kSpokenLanguageTypeId)
class SpokenLanguages {
  @JsonKey(name: 'english_name')
  @HiveField(0)
  String? englishName;
  
  @JsonKey(name: 'iso_639_1')
  @HiveField(1)
  String? iso6391;
  
  @JsonKey(name: 'name')
  @HiveField(2)
  String? name;

  SpokenLanguages({this.englishName, this.iso6391, this.name});

  factory SpokenLanguages.fromJson(Map<String, dynamic> json)=> _$SpokenLanguagesFromJson(json);
}