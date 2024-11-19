import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.purple,
    brightness: Brightness.light,
  ),
  dividerColor: Colors.black38,
  highlightColor: Colors.purple,
  sliderTheme: SliderThemeData(
    thumbColor: Colors.purple,
    activeTrackColor: Colors.black38,
    inactiveTrackColor: Colors.black38,
    trackHeight: 1,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      shape: WidgetStatePropertyAll(RoundedRectangleBorder()),
      backgroundColor: WidgetStatePropertyAll(Colors.purple),
      foregroundColor:
          WidgetStatePropertyAll(const Color.fromARGB(255, 226, 216, 216)),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      shape: WidgetStatePropertyAll(RoundedRectangleBorder()),
      side: WidgetStatePropertyAll(BorderSide(color: Colors.black38)),
      foregroundColor: WidgetStatePropertyAll(Colors.black),
    ),
  ),
);

final darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: Colors.purple,
  ),
  dividerColor: Colors.white38,
  highlightColor: Colors.purple,
  sliderTheme: SliderThemeData(
    thumbColor: Colors.purple,
    activeTrackColor: Colors.white38,
    inactiveTrackColor: Colors.white38,
    trackHeight: 1,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      shape: WidgetStatePropertyAll(RoundedRectangleBorder()),
      backgroundColor: WidgetStatePropertyAll(Colors.purple),
      foregroundColor: WidgetStatePropertyAll(Colors.white38),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      shape: WidgetStatePropertyAll(RoundedRectangleBorder()),
      side: WidgetStatePropertyAll(BorderSide(color: Colors.white38)),
      foregroundColor: WidgetStatePropertyAll(Colors.white38),
    ),
  ),
);
