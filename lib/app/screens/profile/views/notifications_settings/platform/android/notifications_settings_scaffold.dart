import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/src/utils/components/my_app_bar.dart';

import '../../../../../../../src/constants/consts.dart';
import '../../../../../../../src/controllers/app/notifications_settings_controller.dart';
import '../../../../../../../theme/colors.dart';
import '../../content/common_settings.dart';
import '../../content/system_and_service_settings.dart';

class NotificationsSettingsScaffold
    extends GetView<NotificationsSettingsController> {
  const NotificationsSettingsScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: myAppBar(colorScheme, media, title: "Notifications Settings"),
      body: SafeArea(
        child: Scrollbar(
          controller: controller.scrollController,
          child: GetBuilder<NotificationsSettingsController>(
            init: NotificationsSettingsController(),
            builder: (controller) {
              return ListView(
                controller: controller.scrollController,
                padding: const EdgeInsets.all(10),
                children: [
                  Text(
                    "Common",
                    textAlign: TextAlign.start,
                    style: defaultTextStyle(
                      color: kTextBoldHeadingColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  kHalfSizedBox,
                  commonSettings(colorScheme, controller),
                  kSizedBox,
                  kSizedBox,
                  Text(
                    "System & services update",
                    textAlign: TextAlign.start,
                    style: defaultTextStyle(
                      color: kTextBoldHeadingColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  kHalfSizedBox,
                  systemAndServiceSettings(colorScheme, controller),
                  kSizedBox,
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
