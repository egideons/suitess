import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/views/android/splash/loading/content/android_loading_screen_content.dart';

import '../../../../../controllers/others/loading_controller.dart';

class AndroidLoadingScreenScaffold extends GetView<LoadingController> {
  final void Function()? loadData;
  const AndroidLoadingScreenScaffold({super.key, this.loadData});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    var colorScheme = Theme.of(context).colorScheme;

    Timer(Duration.zero, loadData ?? () {});

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            androidLoadingScreenContent(media, colorScheme),
          ],
        ),
      ),
    );
  }
}
