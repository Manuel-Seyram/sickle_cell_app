import 'package:flutter/material.dart';
import 'package:sickle_cell_app/screens/splash_screen.dart';

void main() {

  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
    colorScheme: ColorScheme.light(
      primary: Colors.red.shade100,
  	),
  ),
    home: const SplashScreen(),
  ));
}

