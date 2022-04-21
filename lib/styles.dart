
import 'package:flutter/material.dart';

class ThemeConfig{
  static final  appTheme = ThemeData(

    brightness: Brightness.light,
    primarySwatch: Colors.grey,
    scaffoldBackgroundColor: Colors.white,
    //backgroundColor: HexColor('#ECC649'),



    // AppBar Theme
    appBarTheme:   const AppBarTheme(
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(fontWeight: FontWeight.w700, fontStyle: FontStyle.normal, color: Colors.black, fontSize: 18.0),
        centerTitle: false,
        elevation: 5.0,
        iconTheme: IconThemeData(
            color: Colors.black
        )
    ),

    // Text FormField
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.white,
      filled: true,
      hintStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, fontStyle: FontStyle.normal,  ),
      contentPadding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 21.0),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(width: 2.5, color: Colors.black38,)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(width: 2.5, color: Colors.black38,)),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(width: 1.5, color: Colors.black38,)),
    ),
  );

}
