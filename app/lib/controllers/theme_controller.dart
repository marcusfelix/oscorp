
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ColorScheme _scheme = ColorScheme.fromSeed(seedColor: Colors.blueGrey);

ThemeData _theme = ThemeData.from(
  colorScheme: _scheme,
);

final theme = _theme.copyWith(
  appBarTheme: AppBarTheme(
    elevation: 0.0,
    backgroundColor: _scheme.background,
    titleTextStyle: TextStyle(
      color: _scheme.primary,
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      letterSpacing: -1
    ),
    iconTheme: IconThemeData(
      color: _scheme.primary,
    ),
    centerTitle: false
  ),
  textTheme: GoogleFonts.interTextTheme(_theme.textTheme),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderSide: BorderSide(
        color: _scheme.onPrimaryContainer,
        width: 2.0,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: _scheme.primaryContainer,
        width: 2.0,
      ),
    ),
  ),
  tabBarTheme: const TabBarTheme(
    indicator: BoxDecoration(),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    elevation: 0,
    focusElevation: 0.0,
    hoverElevation: 0.0,
    disabledElevation: 0.0,
    highlightElevation: 0.0,
  ),
  popupMenuTheme: PopupMenuThemeData(
    elevation: 0,
    color: _scheme.primaryContainer,
    textStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: _scheme.onPrimaryContainer
    )
  )
);