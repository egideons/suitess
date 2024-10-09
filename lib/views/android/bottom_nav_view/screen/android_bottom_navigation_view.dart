import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:suitess/controllers/app/bottom_navigation_controller.dart';

import '../content/android_bottom_navigation_view_scaffold.dart';

class AndroidBottomNavigationView extends StatelessWidget {
  final int? currentIndex;
  const AndroidBottomNavigationView({super.key, this.currentIndex});

  @override
  Widget build(BuildContext context) {
    Get.put(BottomNavigationController());
    var controller = BottomNavigationController.instance;

    return AndroidBottomNavigationViewScaffold(
      currentIndex: currentIndex ?? controller.navCurrentIndex.value,
    );
  }
}
