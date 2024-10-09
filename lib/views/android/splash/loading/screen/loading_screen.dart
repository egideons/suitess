// ignore_for_file: unrelated_type_equality_checks

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controllers/others/loading_controller.dart';
import '../platform/android/loading_screen_scaffold.dart';
import '../platform/ios/loading_screen_cupertino_scaffold.dart';

class LoadingScreen extends StatelessWidget {
  final void Function()? loadData;
  const LoadingScreen({super.key, this.loadData});

  @override
  Widget build(BuildContext context) {
    //Initialize controller
    Get.put(LoadingController());

    if (Platform.isIOS) {
      return LoadingScreenCupertinoScaffold(loadData: loadData);
    }
    return LoadingScreenScaffold(loadData: loadData);
  }
}
