import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:suitess/src/controllers/app/landlord_navigation_overview_controller.dart';

import '../widgets/android/bottom_navigation_view_scaffold.dart';
import '../widgets/ios/bottom_navigation_view_cupertino_scaffold.dart';

class BottomNavigationView extends StatelessWidget {
  const BottomNavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BottomNavigationController());

    if (Platform.isIOS) {
      return const BottomNavigationViewCupertinoScaffold();
    }
    return const BottomNavigationViewScaffold();
  }
}
