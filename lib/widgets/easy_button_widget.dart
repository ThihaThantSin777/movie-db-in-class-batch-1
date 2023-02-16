import 'package:flutter/material.dart';
import 'package:movie_db/constant/dimen.dart';
import 'package:movie_db/widgets/easy_text_widget.dart';

import '../constant/color.dart';

class EasyButtonWidgets extends StatelessWidget {
  const EasyButtonWidgets({Key? key, required this.icon, required this.data,  this.checked = false}) : super(key: key);
  final IconData icon;
  final String data;
  final bool checked;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(onPressed: (){
    }, icon: Icon(icon,color: checked?cGrey:cAmber,), label: EasyTextWidget( data: data,),
        style: ElevatedButton.styleFrom(
          backgroundColor: checked?cAmber:Colors.transparent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(dMp20x))
          ),
          side: BorderSide(
            width: checked?dMp0x:dMp1x,
            color: cWhite
          )
        ),
    );
  }
}
