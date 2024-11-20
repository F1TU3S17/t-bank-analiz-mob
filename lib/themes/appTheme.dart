import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  useMaterial3: true,
  primaryColor: Colors.black,
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.yellow, //Основный акцентный цвет
    brightness: Brightness.dark,  // Темный режим
  ),


  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.yellow, // Фон кнопок
      foregroundColor: Colors.black, // Текст на кнопках
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // Скругленные углы
      ),
      elevation: 4, // Тень кнопок
    ),
  ),
);