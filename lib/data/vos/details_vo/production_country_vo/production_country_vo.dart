import 'package:json_annotation/json_annotation.dart';

part 'production_country_vo.g.dart';

@JsonSerializable()
class ProductionCountryVO {
  @JsonKey(name: 'iso_3166_1')
  String? iso;

  @JsonKey(name: 'name')
  String? name;


  ProductionCountryVO(this.iso, this.name);

  factory ProductionCountryVO.fromJson(Map<String, dynamic> json) =>
      _$ProductionCountryVOFromJson(json);
}
