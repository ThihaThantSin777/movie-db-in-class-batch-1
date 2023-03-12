// extension ListtoString on String{
//   String ListtoString(List<String?>){
//     return
//   }
// }

extension Extension on String{
  String timeFormat (num time){
    int hour=time~/60;
    int minis=(time%60).toInt();

    return '${hour}hr ${minis}min';
  }

  String addS(int count, {bool isCharacterSUpperCase = false}) => (count <= 1)
      ? this
      : (isCharacterSUpperCase)
      ? '${this}S'
      : '${this}s';
}