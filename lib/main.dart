import 'package:Tiger/splash_screen.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(FoodApp());
}

class FoodApp extends StatelessWidget {
  const FoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     home: SplashScreen(),
    );
  }
}

