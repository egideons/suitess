// ignore_for_file: unrelated_type_equality_checks

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kribb/src/controllers/loading_controller.dart';

import '../widgets/android/loading_screen_scaffold.dart';
import '../widgets/ios/loading_screen_cupertino_scaffold.dart';

class LoadingScreen extends StatelessWidget {
  final Function()? loadData;
  const LoadingScreen({super.key, this.loadData});

  @override
  Widget build(BuildContext context) {
    //Initialize controller
    Get.put(LoadingController());

    if (Platform.isIOS) {
      return GetBuilder<LoadingController>(
        init: LoadingController(),
        initState: (state) => loadData,
        builder: (controller) {
          return const LoadingScreenCupertinoScaffold();
        },
      );
    }
    return GetBuilder<LoadingController>(
      init: LoadingController(),
      initState: (state) => loadData,
      builder: (controller) {
        return const LoadingScreenScaffold();
      },
    );
  }
}
