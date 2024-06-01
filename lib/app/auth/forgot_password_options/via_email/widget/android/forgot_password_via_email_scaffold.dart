import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/src/utils/components/responsive_constants.dart';

import '../../../../../../src/controllers/auth/forgot_password_via_email_controller.dart';

class ForgotPasswordViaEmailScaffold
    extends GetView<ForgotPasswordViaEmailController> {
  const ForgotPasswordViaEmailScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    final forgotPasswordViaController =
        ForgotPasswordViaEmailController.instance;

    //Mobile Landscape mode or larger screens
    if (deviceType(media.width) > 1) {
      return Scaffold(
        backgroundColor: colorScheme.surface,
        body: Row(
          children: [
            SizedBox(
              width: media.width / 2.2,
              child: Column(
                children: [
                  Container(),
                ],
              ),
            )
          ],
        ),
      );
    }

    //Mobile Portrait mode
    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: ListView(
          children: const [],
        ),
      ),
    );
  }
}
