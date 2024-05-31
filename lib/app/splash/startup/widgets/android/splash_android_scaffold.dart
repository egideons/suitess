import 'package:flutter/material.dart';

import '../../content/splash_page_content.dart';

class StartupSplashAndroidScaffold extends StatelessWidget {
  const StartupSplashAndroidScaffold({super.key});

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
            startupSplashScreen(media: media, colorScheme: colorScheme),
          ],
        ),
      ),
    );
  }
}
