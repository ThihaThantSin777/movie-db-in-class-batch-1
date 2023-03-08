import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movie_db/constant/dao_constant.dart';
import 'package:movie_db/data/vos/detail_vos/production_company_vo.dart';
import 'package:movie_db/data/vos/detail_vos/production_country_vo.dart';
import 'package:movie_db/data/vos/detail_vos/spoken_language_vo.dart';
import 'package:movie_db/data/vos/genre_vo/genre_vo.dart';
import 'package:movie_db/data/vos/movie_vo/movie_vo/movie_vo.dart';
import 'package:movie_db/network/response/detail_response/detail_response.dart';

import 'package:movie_db/pages/home_page.dart';

import 'data/vos/detail_vos/belong_to_vo.dart';


void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(MovieVOAdapter());
  Hive.registerAdapter(DetailResponseAdapter());
  Hive.registerAdapter(BelongsToCollectionAdapter());
  Hive.registerAdapter(ProductionCountriesAdapter());
  Hive.registerAdapter(ProductionCompaniesAdapter());
  Hive.registerAdapter(SpokenLanguagesAdapter());
  Hive.registerAdapter(GenreVOAdapter());
  await Hive.openBox<MovieVO>(kMovieBox);
  await Hive.openBox<DetailResponse>(kDetailBox);
  runApp(const MyApp());
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

