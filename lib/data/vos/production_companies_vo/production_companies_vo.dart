
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../constant/persistent_constant.dart';

part 'production_companies_vo.g.dart';
@JsonSerializable()
@HiveType(typeId: kHiveProductionCompaniesVOType)
class ProductionCompaniesVO {

  @HiveField(0)
  @JsonKey(name: 'id')
  int? id;

  @HiveField(1)
  @JsonKey(name: 'logo_path')
  String? logoPath;

  @HiveField(2)
  @JsonKey(name: 'name')
  String? name;

  @HiveField(3)
  @JsonKey(name: 'origin_country')
  String? originCountry;


  ProductionCompaniesVO({this.id, this.logoPath, this.name, this.originCountry});

 factory ProductionCompaniesVO.fromJson(Map<String, dynamic> json) =>_$ProductionCompaniesVOFromJson(json);

  Map<String, dynamic> toJson() =>_$ProductionCompaniesVOToJson(this);
}