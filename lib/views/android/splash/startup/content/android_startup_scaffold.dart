import 'package:flutter/material.dart';

import 'android_startup_page_content.dart';

class AndroidStartupScaffold extends StatelessWidget {
  const AndroidStartupScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    var colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            androidStartupSplashScreen(
              media,
              colorScheme,
            ),
          ],
        ),
      ),
    );
  }
}
