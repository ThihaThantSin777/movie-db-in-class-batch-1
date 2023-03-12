
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../constant/persistent_constant.dart';

part 'genres_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveGenresVOType)
class GenresVO {

  @HiveField(0)
  @JsonKey(name: 'id')
  int? id;

  @HiveField(1)
  @JsonKey(name: 'name')
  String? name;

  GenresVO({this.id, this.name});

 factory GenresVO.fromJson(Map<String, dynamic> json) =>_$GenresVOFromJson(json);

  Map<String, dynamic> toJson() =>_$GenresVOToJson(this);
}