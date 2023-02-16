import 'package:flutter/material.dart';

extension NavigateScreen on Widget{
  void navigateToNextScreen(context, widget){
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context)=> widget)
    );
  }
}