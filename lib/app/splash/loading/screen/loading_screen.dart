// ignore_for_file: unrelated_type_equality_checks

import 'dart:io';

import 'package:flutter/material.dart';

import '../widgets/android/loading_screen_scaffold.dart';
import '../widgets/ios/loading_screen_cupertino_scaffold.dart';

class LoadingScreen extends StatelessWidget {
  final void Function()? loadData;
  const LoadingScreen({super.key, this.loadData});

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return LoadingScreenCupertinoScaffold(loadData: loadData);
    }
    return LoadingScreenScaffold(loadData: loadData);
  }
}
