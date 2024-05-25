import 'package:flutter/material.dart';
import 'package:suitess/app/splash/congratulations/content/congratulations_splash_screen_content.dart';

class CongratulationsSplashScreenAndroidScaffold extends StatelessWidget {
  const CongratulationsSplashScreenAndroidScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            congratulationsSplashScreenContent(
              media: media,
              colorScheme: colorScheme,
            ),
          ],
        ),
      ),
    );
  }
}
