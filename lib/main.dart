import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_db/constant/api_constant.dart';
import 'package:movie_db/constant/persistent_constant.dart';
import 'package:movie_db/data/apply/movie_db_apply_impl.dart';
import 'package:movie_db/data/apply/movie_db_apply.dart';
import 'package:movie_db/data/vos/movie_vo/movie_vo.dart';
import 'package:movie_db/network/api/movie_api.dart';
import 'package:movie_db/network/response/movie_details_response/movie_details_response.dart';
import 'package:movie_db/pages/home_page.dart';

import 'data/vos/belongtoCollection_vo/belongtoCollection_vo.dart';
import 'data/vos/credits_vo/cast_vo/cast_vo.dart';
import 'data/vos/credits_vo/crew_vo/crew_vo.dart';
import 'data/vos/date_vo/dates_vo.dart';
import 'data/vos/genres_vo/genres_vo.dart';
import 'data/vos/known_for_vo/known_for_vo.dart';
import 'data/vos/production_companies_vo/production_companies_vo.dart';
import 'data/vos/production_countries_vo/production_countries_vo.dart';
import 'data/vos/result_vo/result_vo.dart';
import 'data/vos/spoken_language_vo/spoken_language_vo.dart';
import 'network/response/credits_response/credits_response.dart';

void main() async{
 await Hive.initFlutter();
 Hive.registerAdapter(MovieVOAdapter());
 Hive.registerAdapter(ResultsVOAdapter());
 Hive.registerAdapter(MovieDetailsResponseAdapter());
 Hive.registerAdapter(CastVOAdapter());
 Hive.registerAdapter(CrewVOAdapter());
 Hive.registerAdapter(BelongsToCollectionVOAdapter());
 Hive.registerAdapter(GenresVOAdapter());
 Hive.registerAdapter(KnownForVOAdapter());
 Hive.registerAdapter(ProductionCompaniesVOAdapter());
 Hive.registerAdapter(ProductionCountriesVOAdapter());
 Hive.registerAdapter(SpokenLanguagesVOAdapter());
 Hive.registerAdapter(DatesVOAdapter());
 Hive.registerAdapter(CreditsResponseAdapter());



 await Hive.openBox<MovieVO>(kHiveBoxMovie);
 await Hive.openBox<ResultsVO>(kHiveActorsBox);
 await Hive.openBox<MovieDetailsResponse>(kHiveMovieDetailsBox);
 await Hive.openBox<CastVO>(kHiveMovieDetailsActorsBox);
 await Hive.openBox<CrewVO>(kHiveMovieDetailsCreatorsBox);
 await Hive.openBox<CreditsResponse>(kHiveMovieCreditsResponseBox);


 runApp(const MyApp());
  // MovieAPI movieAPI=MovieAPI(Dio());
  // movieAPI.getMovieDetails(kApiKey, 505642).then((value) {
  //   print("Your Api working or no Working ==================>$value");
  // });

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

