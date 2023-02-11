import 'package:flutter/material.dart';

import '../constant/color.dart';
import '../constant/dimen.dart';
import '../widgets/easy_text_widget.dart';

class LocationSection extends StatelessWidget {
  const LocationSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(dMp5x),
      height: dWh200x,
      child: Card(
        color: cSecondary,
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: dMp20x,bottom: dMp20x,left: dMp10x),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    EasyTextWidget(data: "Checked Movie\nShowtimes",
                      fontSize: dFs20x,
                      fontWeight: FontWeight.bold,
                      color: cWhite,),
                    Spacer(),
                    EasyTextWidget(data: "SEE MORE",
                      fontWeight: FontWeight.bold,
                      color: cAmber,
                      textDecoration: TextDecoration.underline,
                    ),
                    ]
                ),
              ),
            ),
            const Expanded(child:  Icon(Icons.location_pin,size: dFs70x,color: cWhite,)),
          ],
        ),
      ),
    );
  }
}
