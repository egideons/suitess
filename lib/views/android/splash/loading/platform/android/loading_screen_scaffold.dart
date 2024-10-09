import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/views/android/splash/loading/content/loading_screen_content.dart';

import '../../../../../../controllers/others/loading_controller.dart';

class LoadingScreenScaffold extends GetView<LoadingController> {
  final void Function()? loadData;
  const LoadingScreenScaffold({super.key, this.loadData});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    Timer(Duration.zero, loadData ?? () {});

    return Scaffold(
      backgroundColor: colorScheme.surface,
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
