import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_db/constant/dao_constant.dart';
part 'production_country_vo.g.dart';
@JsonSerializable()
@HiveType(typeId: kProductionCountryTypeId)
class ProductionCountries {
  @JsonKey(name: 'iso_3166_1')
  @HiveField(0)
  String? iso31661;
  @JsonKey(name: 'name')
  @HiveField(1)
  String? name;

  ProductionCountries({this.iso31661, this.name});

  factory ProductionCountries.fromJson(Map<String, dynamic> json) =>
      _$ProductionCountriesFromJson(json);
  }