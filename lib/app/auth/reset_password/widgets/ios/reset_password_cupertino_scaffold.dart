import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kribb/app/auth/components/auth_cupertino_nav_bar.dart';

import '../../../../../src/controllers/reset_password_controller.dart';

class ResetPasswordCupertinoScaffold extends GetView<ResetPasswordController> {
  const ResetPasswordCupertinoScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    return CupertinoPageScaffold(
      navigationBar: authCupertinoNavBar(
        previousPageTitle: "Back",
        media: media,
        colorScheme: colorScheme,
      ),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: const [],
        ),
      ),
    );
  }
}
