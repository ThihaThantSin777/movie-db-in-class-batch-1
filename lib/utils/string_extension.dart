
import '../data/vos/detail_vos/production_country_vo.dart';
import '../data/vos/genre_vo/genre_vo.dart';

extension StringExtension on String{
String getTimeString(value) {
  final int hour = value ~/ 60;
  final int minutes = value % 60;
  return '${hour.toString()}hours${minutes.toString()}minutes';
}
String getComma(List<GenreVO> genre){
  String temp = '';
  for(int i = 0;i<genre.length;i++){
    String name = genre[i].name ?? '';
    temp += '$name,';
  }
  return temp;
}
String getCountry(List<ProductionCountries> county){
  String name = '';
  for(int i = 0 ;i<county.length;i++){
    String temp = county[i].name ?? '';
    name = temp;
  }
  return name;
}
}