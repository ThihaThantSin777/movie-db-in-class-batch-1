import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../constant/dao_constant.dart';
part 'genre_vo.g.dart';
@JsonSerializable()
@HiveType(typeId: kGenreTypeId)
class GenreVO{
  @HiveField(0)
  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'name')
  @HiveField(1)
  String? name;

  GenreVO(this.id, this.name);

  factory GenreVO.fromJson(Map<String,dynamic> json) => _$GenreVOFromJson(json);
}