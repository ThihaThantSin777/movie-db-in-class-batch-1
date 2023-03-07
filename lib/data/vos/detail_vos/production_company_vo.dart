import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_db/constant/dao_constant.dart';
part 'production_company_vo.g.dart';
@JsonSerializable()
@HiveType(typeId: kProductionCompanyTypeId)
class ProductionCompanies {
  @JsonKey(name: 'id')
  @HiveField(0)
  int? id;

  @JsonKey(name: 'logo_path')
  @HiveField(1)
  String? logoPath;

  @JsonKey(name: 'name')
  @HiveField(2)
  String? name;

  @JsonKey(name: 'original_country')
  @HiveField(3)
  String? originCountry;

  ProductionCompanies({this.id, this.logoPath, this.name, this.originCountry});
  factory ProductionCompanies.fromJson(Map<String,dynamic> json)=>
      _$ProductionCompaniesFromJson(json);
}