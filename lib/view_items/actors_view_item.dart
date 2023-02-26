import 'package:flutter/material.dart';
import '../constant/api_constant.dart';
import '../constant/colors.dart';
import '../constant/dimens.dart';
import '../constant/strings.dart';
import '../data/apply/movie_db_apply_impl.dart';
import '../data/apply/movie_db_apply.dart';
import '../data/vos/actors_vo/actors_vo.dart';
import '../widgets/title_widget.dart';
import 'actor_icon_view.dart';
import 'actors_image_view.dart';
import 'actors_name_and_icon_view.dart';

class ActorsItemView extends StatefulWidget {
  const ActorsItemView({
    Key? key,
  }) : super(key: key);

  @override
  State<ActorsItemView> createState() => _ActorsItemViewState();
}

class _ActorsItemViewState extends State<ActorsItemView> {
  final ScrollController _scrollController = ScrollController();
  final MovieDBApply movieDBApply = MovieDBApplyImpl();
  List<ActorsVO> actorsList = [];

  int page = 1;

  @override
  void initState() {
    super.initState();
    movieDBApply.actors(page).then((value) {
      setState(() {
        actorsList = value ?? [];
      });
    });
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        double pixel = _scrollController.position.pixels;
        if (pixel != 0) {
          page++;
          movieDBApply.actors(page).then((value) {
            if (value?.isNotEmpty ?? false) {
              final temp = value;
              temp?.forEach((element) {
                actorsList.add(element);
              });
              setState(() {});
            }
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kActorHeight,
      width: double.infinity,
      child: Stack(
        children: [
          Container(
            color: kCardColor,
            height: kActorHeight,
            width: double.infinity,
            child: SizedBox(
              height: kActorHeight,
              child: ListView.builder(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: actorsList.length,
                itemBuilder: (BuildContext context, int index) {

                  String? image = actorsList[index].profilePath;
                  String? name = actorsList[index].name;
                  String? vote = actorsList[index].popularity.toString();

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          /// Actor Image
                          ActorsImageView(
                            imageUrl: (image != null)
                                ? '$kPrefixImageLink$image'
                                : kDefaultImage,
                          ),

                          /// favourite Icon
                          const ActorsIconView(),

                          /// Actors Name and Icon
                          ActorsNameAndIcon(
                            name: name ?? '',
                            voteCount: vote,
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),

          /// Actors Title
          const Padding(
            padding: EdgeInsets.only(top: 15, left: 15, right: 15),
            child: TitleWidget(
              rightText: kMoreActorText,
              leftText: kBestActorText,
            ),
          )
        ],
      ),
    );
  }
}
