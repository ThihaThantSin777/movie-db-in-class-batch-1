import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../constant/persistent_constant.dart';
part 'dates_vo.g.dart';
@JsonSerializable()
@HiveType(typeId: kHiveDateVOType)
class DatesVO{
  
  @HiveField(0)
  @JsonKey(name: "maximum")
  String? maximum;
  
  @HiveField(1)
  @JsonKey(name: "minimum")
  String? minimum;

  DatesVO(this.maximum, this.minimum);
  factory DatesVO.fromJson(Map<String,dynamic> json) => _$DatesVOFromJson(json);
}