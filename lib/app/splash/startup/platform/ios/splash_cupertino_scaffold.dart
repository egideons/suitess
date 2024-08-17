import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../content/splash_page_content.dart';

class SplashCupertinoScaffold extends StatelessWidget {
  const SplashCupertinoScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    return CupertinoPageScaffold(
      child: SafeArea(
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            startupSplashScreen(media, colorScheme),
          ],
        ),
      ),
    );
  }
}
