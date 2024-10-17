import 'package:flutter/material.dart';

import '../content/android_transfer_options_scaffold.dart';

class AndroidTransferOptionsScreen extends StatelessWidget {
  const AndroidTransferOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const AndroidTransferOptionsScaffold(),
    );
  }
}
