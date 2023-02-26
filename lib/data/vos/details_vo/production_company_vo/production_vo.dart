import 'package:json_annotation/json_annotation.dart';

part 'production_vo.g.dart';

@JsonSerializable()
class ProductionCompanies {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'logo_path')
  String? logoPath;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'origin_country')
  String? originCountry;

  ProductionCompanies({this.id, this.logoPath, this.name, this.originCountry});

  factory ProductionCompanies.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompaniesFromJson(json);
}
