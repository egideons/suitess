import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../content/loading_screen_content.dart';

class LoadingScreenCupertinoScaffold extends StatelessWidget {
  const LoadingScreenCupertinoScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    return CupertinoPageScaffold(
      child: SafeArea(
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            loadingScreenContent(media: media, colorScheme: colorScheme),
          ],
        ),
      ),
    );
  }
}
