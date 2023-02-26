import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movie_db/constant/api_constant.dart';
import 'package:movie_db/network/api/movie_api.dart';
import 'package:movie_db/pages/home_page.dart';

void main() {
  runApp(const MyApp());
  //MovieDBApply movieDBApply = MovieDBApplyImpl();
  // movieDBApply.getDetails(c).then((value) {
  //   print(value);
  // }).catchError((e)=>print('error================>$e'));
  
  MovieAPI movieAPI = MovieAPI(Dio());
  movieAPI.getDetails(kApiKey, 505642).then((value){
    print('value==========>$value');
  }).catchError((e)=>print('====================>$e'));

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

