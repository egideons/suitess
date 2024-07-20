import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/src/utils/components/my_app_bar.dart';

import '../../../../../../../src/controllers/app/password_settings_controller.dart';
import '../../content/change_password_field.dart';

class PasswordSettingsScaffold extends GetView<PasswordSettingsController> {
  const PasswordSettingsScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    // var controller = PasswordSettingsController.instance;
    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: myAppar(colorScheme, media, title: "Password"),
      body: SafeArea(
        child: Scrollbar(
          controller: controller.scrollController,
          child: GetBuilder<PasswordSettingsController>(
            init: PasswordSettingsController(),
            builder: (controller) {
              return ListView(
                controller: controller.scrollController,
                padding: const EdgeInsets.all(10),
                physics: const BouncingScrollPhysics(),
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                          width: 1,
                          color: colorScheme.inversePrimary.withOpacity(.4),
                        ),
                      ),
                    ),
                    child: changePassword(
                      colorScheme,
                      changePasswordFunc: () {},
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
