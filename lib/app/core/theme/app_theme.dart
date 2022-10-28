import 'package:flutter/material.dart';

var colorScheme = ColorScheme.fromSeed(seedColor: Colors.greenAccent);

var radioTheme = RadioThemeData(
  fillColor: MaterialStateColor.resolveWith((states) => colorScheme.primary),
);

var elevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    onPrimary: colorScheme.onPrimary,
    primary: colorScheme.primary
  )
);    

final ThemeData themeData =
    ThemeData(
      colorScheme: colorScheme, 
      useMaterial3: true,
      radioTheme: radioTheme,
      elevatedButtonTheme: elevatedButtonTheme,
      );

  
