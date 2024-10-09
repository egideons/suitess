import 'dart:io';

import 'package:flutter/material.dart';

import '../platform/android/transfer_options_scaffold.dart';

class TransferOptions extends StatelessWidget {
  const TransferOptions({super.key});

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return GestureDetector(
        onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
        // child: const HomeScreenCupertinoScaffold(),
      );
    }
    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const TransferOptionsScaffold(),
    );
  }
}
