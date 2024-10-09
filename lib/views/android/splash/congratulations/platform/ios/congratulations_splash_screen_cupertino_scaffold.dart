import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:suitess/views/android/splash/congratulations/content/congratulations_splash_screen_content.dart';

class CongratulationsSplashScreenCupertinoScaffold extends StatelessWidget {
  const CongratulationsSplashScreenCupertinoScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    return CupertinoPageScaffold(
      child: SafeArea(
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
