import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/ui/screens/splash_screen.dart';
import 'ui/screens/home_screen.dart';
import 'utils/theme.dart';

void main() {
  runApp(MarketMindApp());
}

class MarketMindApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Market Mind',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
