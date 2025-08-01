import 'package:flutter/material.dart';

final ThemeData travelAppTheme = ThemeData(
  colorScheme: const ColorScheme.light(primary: Color(0xFF0D6EFD)),

  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 34,

      fontWeight: FontWeight.normal,
      fontFamily: 'Geometr415',
    ),
    titleLarge: TextStyle(fontSize: 30, fontFamily: 'SFUI'),
    bodyMedium: TextStyle(fontFamily: 'SFUI', fontSize: 16),
    displaySmall: TextStyle(
      fontFamily: 'SFUI',
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
    labelSmall: TextStyle(
      fontFamily: 'SFUI',
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
  ),
  iconTheme: IconThemeData(color: Colors.grey.shade600),
);
