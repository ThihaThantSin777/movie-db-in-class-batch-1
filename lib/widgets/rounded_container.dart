import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant/color.dart';
import '../constant/dimen.dart';
import 'easy_text_widget.dart';

class RoundedContainer extends StatelessWidget {
  const RoundedContainer({Key? key,required this.data,this.checked= false}) : super(key: key);
    final String data;
    final bool checked;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all((checked)?dMp5x:dMp10x),
      margin: const EdgeInsets.only(right: dMp3x),
      decoration: BoxDecoration(
          color: (checked)?cGrey:cAmber,
          borderRadius: BorderRadius.all(Radius.circular((checked)?dMp20x:dMp20x))
      ),
      child: EasyTextWidget(data: data,fontSize: (checked)?dFs14x:dFs16x,color: (checked)?cPrimary:cWhite,)
    );
  }
}
