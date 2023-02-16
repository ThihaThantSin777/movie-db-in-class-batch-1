import 'package:json_annotation/json_annotation.dart';
part 'production_country_vo.g.dart';
@JsonSerializable()
class ProductionCountries {
  @JsonKey(name: 'iso_3166_1')
  String? iso31661;
  @JsonKey(name: 'name')
  String? name;

  ProductionCountries({this.iso31661, this.name});

  factory ProductionCountries.fromJson(Map<String, dynamic> json) =>
      _$ProductionCountriesFromJson(json);
  }