import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

// ignore: avoid_classes_with_only_static_members
class MyTheme{
  static ThemeData lightTheme (BuildContext context)=> 
    ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.poppins().fontFamily, 
        cardColor: Colors.white,
      canvasColor: creamColor,
      buttonColor: darkBluishColor,
      accentColor: darkBluishColor,
       appBarTheme:  AppBarTheme(
         color: Colors.white,
         elevation: 0.0,
         iconTheme: const IconThemeData(color: Colors.black),
         textTheme: Theme.of(context).textTheme
         )
        );
        static ThemeData darkTheme (BuildContext context)=> 
    ThemeData(
      fontFamily: GoogleFonts.poppins().fontFamily, 
      brightness: Brightness.dark,
      cardColor: Colors.black,
      canvasColor: darkcreamColor,
      buttonColor: lightBluishColor,
      accentColor: Colors.white,
       appBarTheme:  AppBarTheme(
         color: Colors.black,
         elevation: 0.0,
         iconTheme: const IconThemeData(color: Colors.white),
         textTheme: Theme.of(context).textTheme.copyWith(
           headline6: context.textTheme.headline6!.copyWith(
             color: Colors.white
           )
         )
         )
        );
       

static Color creamColor = const Color(0xfff5f5f5);
static Color darkcreamColor = Vx.gray800;
  static Color darkBluishColor = const Color(0xff403b58);
static Color lightBluishColor = Vx.indigo500;
}
