import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kribb/app/splash/loading/content/loading_screen_content.dart';

class LoadingScreenScaffold extends StatelessWidget {
  final void Function()? loadData;
  const LoadingScreenScaffold({super.key, this.loadData});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    Timer(Duration.zero, loadData ?? () {});

    return Scaffold(
      body: SafeArea(
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
