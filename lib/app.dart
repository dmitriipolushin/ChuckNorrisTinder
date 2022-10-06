import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'styles.dart';
import 'screens/home_screen.dart';

class ChuckNorrisTinder extends StatelessWidget {
  const ChuckNorrisTinder({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return MaterialApp(
      theme: ThemeData(
        primaryColor: Styles.scaffoldBackground,
      ),
      home: const HomeScreen(),
    );
  }
}
