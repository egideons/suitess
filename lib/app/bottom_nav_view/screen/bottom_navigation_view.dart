import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:suitess/src/controllers/app/bottom_navigation_controller.dart';

import '../platform/android/bottom_navigation_view_scaffold.dart';
import '../platform/ios/bottom_navigation_view_cupertino_scaffold.dart';

class BottomNavigationView extends StatelessWidget {
  final int? currentIndex;
  const BottomNavigationView({super.key, this.currentIndex});

  @override
  Widget build(BuildContext context) {
    Get.put(BottomNavigationController());
    var controller = BottomNavigationController.instance;
    if (Platform.isIOS) {
      return const BottomNavigationViewCupertinoScaffold();
    }
    return BottomNavigationViewScaffold(
      currentIndex: currentIndex ?? controller.navCurrentIndex.value,
    );
  }
}
