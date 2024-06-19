import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/src/utils/components/responsive_constants.dart';

import '../../../../../src/routes/routes.dart';
import 'components/app_bar.dart';

class HomeScreenScaffold extends StatelessWidget {
  const HomeScreenScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    if (deviceType(media.width) > 2) {
      return Scaffold(
        backgroundColor: colorScheme.surface,
        appBar: homeAppBar(
          colorScheme,
          media,
          "Enugu, Nigeria.",
          goToNotifications: () {
            Get.toNamed(Routes.notificationsScreen, preventDuplicates: true);
          },
        ),
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(10),
            children: const [],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: homeAppBar(
        colorScheme,
        media,
        "Enugu, Nigeria.",
        goToNotifications: () {
          Get.toNamed(Routes.notificationsScreen, preventDuplicates: true);
        },
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: const [],
        ),
      ),
    );
  }
}
