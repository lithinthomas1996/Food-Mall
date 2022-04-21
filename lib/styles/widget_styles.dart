

import 'package:flutter/material.dart';

class AppWidgets{
  static final signInButtonStyle =  ButtonStyle(
      elevation: MaterialStateProperty.all(8.0),
      backgroundColor: MaterialStateProperty.all<Color>( Colors.blue),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(80.0),
          side: const BorderSide(color: Colors.blue)))
  );


  static  const   submitButtonTextStyle =    TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700,color:  Colors.white);
  static  const   groupHeadingStyle =    TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700,color:  Colors.black);




}