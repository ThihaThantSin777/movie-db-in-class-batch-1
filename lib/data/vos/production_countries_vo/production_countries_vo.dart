
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../constant/persistent_constant.dart';

part 'production_countries_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveProductionCountriesVOType)
class ProductionCountriesVO {

  @HiveField(0)
  @JsonKey(name: 'iso_3166_1')
  String? iso31661;

  @HiveField(1)
  @JsonKey(name: 'name')
  String? name;

  ProductionCountriesVO({this.iso31661, this.name});

   factory ProductionCountriesVO.fromJson(Map<String, dynamic> json) =>_$ProductionCountriesVOFromJson(json);
  Map<String, dynamic> toJson() =>_$ProductionCountriesVOToJson(this);
}