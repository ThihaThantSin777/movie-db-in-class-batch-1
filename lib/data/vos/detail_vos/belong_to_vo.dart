import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_db/constant/dao_constant.dart';
part 'belong_to_vo.g.dart';
@JsonSerializable()
@HiveType(typeId: kBelongToTypeId)
class BelongsToCollection {
  @JsonKey(name: 'id')
  @HiveField(0)
  int? id;

  @JsonKey(name: 'name')
  @HiveField(1)
  String? name;

  @JsonKey(name: 'poster_path')
  @HiveField(2)
  String? posterPath;

  @JsonKey(name: 'backdrop_path')
  @HiveField(3)
  String? backdropPath;

  BelongsToCollection({this.id, this.name, this.posterPath, this.backdropPath});

  factory BelongsToCollection.fromJson(Map<String,dynamic> json) => _$BelongsToCollectionFromJson(json);
}