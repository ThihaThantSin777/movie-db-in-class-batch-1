import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movie_db/constant/dao_constant.dart';
import 'package:movie_db/data/vos/movie_vo/movie_vo/movie_vo.dart';

import 'package:movie_db/pages/home_page.dart';


void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(MovieVOAdapter());
  await Hive.openBox<MovieVO>(kMovieBox);
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

