import 'package:flutter/material.dart';
import 'package:suitess/views/android/splash/congratulations/content/android_congratulations_splash_screen_content.dart';

class AndroidCongratulationsSplashScaffold extends StatelessWidget {
  const AndroidCongratulationsSplashScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            androidCongratulationsSplashScreenContent(media, colorScheme),
          ],
        ),
      ),
    );
  }
}
