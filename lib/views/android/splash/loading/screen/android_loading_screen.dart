// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controllers/others/loading_controller.dart';
import '../content/android_loading_screen_scaffold.dart';

class AndroidLoadingScreen extends StatelessWidget {
  final void Function()? loadData;
  const AndroidLoadingScreen({super.key, this.loadData});

  @override
  Widget build(BuildContext context) {
    //Initialize controller
    Get.put(LoadingController());

    return AndroidLoadingScreenScaffold(loadData: loadData);
  }
}
