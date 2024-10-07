import 'package:flutter/material.dart';

import '../../../../../src/controllers/app/home_screen_controller.dart';
import 'home_search_bar.dart';

sliverHomeSearchAppBar(
    ColorScheme colorScheme, HomeScreenController controller, Size media) {
  return SliverAppBar(
    backgroundColor: colorScheme.surface,
    elevation: 0,
    stretch: true,
    pinned: true,
    scrolledUnderElevation: 0,
    toolbarHeight: 70,
    titleSpacing: 10,
    title: homeSearchBar(controller, media, colorScheme),
    bottom: const PreferredSize(
      preferredSize: Size.fromHeight(-10.0),
      child: SizedBox(),
    ),
  );
}
