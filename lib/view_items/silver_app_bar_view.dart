import 'package:flutter/material.dart';
import '../constant/colors.dart';
import '../constant/dimens.dart';
import '../pages/home_page.dart';
import '../widgets/cached_network_image_widgets.dart';
import '../widgets/easy_text_widget.dart';
import '../widgets/rates_and_rating_bar_widget.dart';

class SilverAppBarView extends StatelessWidget {
  const SilverAppBarView({
    Key? key,
    required this.silverAppBarImage,
    required this.releaseDate,
    required this.voteAverage,
    required this.voteCount,
    required this.title,
  }) : super(key: key);

  final String silverAppBarImage;
  final String releaseDate;
  final num voteAverage;
  final String voteCount;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      /// Back Icon
      leadingWidth: 80,
      leading: Padding(
        padding: const EdgeInsets.only(left: 25, top: 12),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (builder) {
              return const HomePage();
            }));
          },
          child: const CircleAvatar(
            backgroundColor: Colors.black,
            radius: kCircleRadius,
            child: kArrowBackIcon,
          ),
        ),
      ),

      /// Search Icon
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 25, top: 5),
          child: Icon(
            kSearchIcon,
            size: kSearchIconSize,
            color: kWhiteColor,
          ),
        ),
      ],
      floating: true,
      expandedHeight: kSilverAppBarHeight,
      backgroundColor: kTransparentColor,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,

        /// 2015, Avatar, Voting and Rating Text

        background: Stack(children: [
          SizedBox(
            width: double.infinity,
            height: kSilverAppBarHeight,
            child: CachedNetworkImageWidgets(imageUrl: silverAppBarImage),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 75,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ///  Release date
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              fixedSize: const Size(75, 45),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                              backgroundColor: kYellowColor,
                            ),
                            onPressed: () {},
                            child: EasyTextWidget(
                              text: releaseDate,
                            )),
                      ),

                      /// Rating Bar and Voting
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RatesAndRatingBarWidget(
                                rate: voteAverage,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              EasyTextWidget(
                                text: voteCount.toString(),
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ],
                          ),

                          /// Rating Text
                          EasyTextWidget(
                            text: voteAverage.toString(),
                            fontSize: 58,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              /// Avatar
              Padding(
                padding: const EdgeInsets.only(left: 18, bottom: 13),
                child: EasyTextWidget(
                  text: title,
                  fontWeight: FontWeight.w500,
                  fontSize: 23,
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
