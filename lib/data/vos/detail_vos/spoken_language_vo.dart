import 'package:json_annotation/json_annotation.dart';
part 'spoken_language_vo.g.dart';
@JsonSerializable()
class SpokenLanguages {
  @JsonKey(name: 'english_name')
  String? englishName;
  @JsonKey(name: 'iso_639_1')
  String? iso6391;
  @JsonKey(name: 'name')
  String? name;

  SpokenLanguages({this.englishName, this.iso6391, this.name});

  factory SpokenLanguages.fromJson(Map<String, dynamic> json)=> _$SpokenLanguagesFromJson(json);
}