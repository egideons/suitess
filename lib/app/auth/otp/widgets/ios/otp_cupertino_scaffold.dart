import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../src/controllers/otp_controller.dart';

class OTPCupertinoScaffold extends StatelessWidget {
  const OTPCupertinoScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    final otpController = OTPController.instance;

    return CupertinoPageScaffold(
      child: ListView(
        children: const [],
      ),
    );
  }
}
