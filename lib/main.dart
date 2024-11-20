import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hakaton4k/sreenes/mainScreen.dart';
import 'package:hakaton4k/themes/appTheme.dart';

void main() {
  debugPaintSizeEnabled = false;
  runApp(const BudgetHelperApp());
  
}

class BudgetHelperApp extends StatelessWidget {
  const BudgetHelperApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      title: 'Финансовый помощник',
      home: const MainScreen(),
    );
  }
}

