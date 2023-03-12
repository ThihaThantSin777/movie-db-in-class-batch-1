

import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../constant/persistent_constant.dart';

part 'belongtoCollection_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveBelongsToCollectionVOType)
class BelongsToCollectionVO {

  @HiveField(0)
  @JsonKey(name: 'id')
  int? id;

  @HiveField(1)
  @JsonKey(name: 'name')
  String? name;

  @HiveField(2)
  @JsonKey(name: 'poster_path')
  String? posterPath;

  @HiveField(3)
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;

  BelongsToCollectionVO({this.id, this.name, this.posterPath, this.backdropPath});

 factory BelongsToCollectionVO.fromJson(Map<String, dynamic> json) =>_$BelongsToCollectionVOFromJson(json);

  Map<String, dynamic> toJson()=>_$BelongsToCollectionVOToJson(this) ;
}
