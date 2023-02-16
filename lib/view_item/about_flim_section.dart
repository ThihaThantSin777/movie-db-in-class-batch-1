import 'package:flutter/cupertino.dart';
import 'package:movie_db/constant/dimen.dart';

import '../constant/color.dart';
import '../widgets/easy_text_widget.dart';


class AboutFilmSection extends StatelessWidget {
  const AboutFilmSection({Key? key,required this.name,required this.generic,required this.country,required this.date,required this.description}) : super(key: key);
 final String name;
 final String generic;
 final String country;
 final String date;
 final String description;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: dWh330x,
      padding: const EdgeInsets.symmetric(horizontal: dMp10x),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           const Expanded(
              flex: 3,
              child: EasyTextWidget(data: 'ABOUT FILM',color: cGrey,fontSize: dFs14x,)),
          Expanded(
              flex: 2,
              child: AboutFilmItems(itemTitle: "Original Title", item: name)),
          const SizedBox(height: dMp3x,),
          Expanded(
              flex: 2,
              child: AboutFilmItems(itemTitle: "Type", item: generic)),
          const SizedBox(height: dMp3x,),
          Expanded(
              flex: 2,
              child: AboutFilmItems(itemTitle: "Production", item: country)),
          const SizedBox(height: dMp3x,),
          Expanded(
              flex: 2,
              child: AboutFilmItems(itemTitle: 'Premier', item: date)),
          const SizedBox(height: dMp3x,),
          Expanded(
              flex: 19,
              child: AboutFilmItems(itemTitle: "Description", item: description)),
          const SizedBox(height: dMp3x,),
        ],
      ),
    );
  }
}
class AboutFilmItems extends StatelessWidget {
  const AboutFilmItems({Key? key, required this.itemTitle, required this.item}) : super(key: key);
  final String itemTitle;
  final String item;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
            child: EasyTextWidget(data: itemTitle,color: cGrey,fontSize: dFs14x,)),
        const SizedBox(width: dMp3x,),
        Expanded(
          flex:3,
            child: EasyTextWidget(data: item,color: cWhite,fontSize: dFs14x,)),
      ],
    );
  }
}

