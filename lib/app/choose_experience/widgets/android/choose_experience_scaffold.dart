import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kribb/app/choose_experience/content/choose_experience_page_header.dart';
import 'package:kribb/theme/colors.dart';

import '../../../../src/constants/consts.dart';
import '../../../../src/controllers/choose_experience_controller.dart';
import 'choose_experience_android_button.dart';

class ChooseExperienceScaffold extends GetView<ChooseExperienceController> {
  const ChooseExperienceScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    var chooseExperienceController = ChooseExperienceController.instance;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.background,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            chooseExperiencePageHeader(
              colorScheme: colorScheme,
              media: media,
              title: "Choose your experience",
              subtitle: "We have just the right platform for you",
            ),
            const SizedBox(height: kDefaultPadding * 2),
            Obx(
              () {
                return chooseExperienceAndroidButton(
                  media,
                  title: "Landlord/Vendor",
                  chooseExperienceController.navigateToLandlord,
                  bgColor: chooseExperienceController.items[0]
                      ? kSuccessColor.withOpacity(0.8)
                      : colorScheme.inversePrimary.withOpacity(0.2),
                  titleColor: chooseExperienceController.items[0]
                      ? kLightBackgroundColor
                      : colorScheme.inversePrimary,
                  iconColor: chooseExperienceController.items[0]
                      ? kLightBackgroundColor
                      : colorScheme.inversePrimary,
                  faIcon: FaIcon(
                    FontAwesomeIcons.buildingUser,
                    color: chooseExperienceController.items[0]
                        ? kLightBackgroundColor
                        : colorScheme.inversePrimary,
                  ),
                );
              },
            ),
            kSizedBox,
            Obx(
              () {
                return chooseExperienceAndroidButton(
                  media,
                  title: "Tenant/Buyer",
                  chooseExperienceController.navigateToTenant,
                  bgColor: chooseExperienceController.items[1]
                      ? kSuccessColor.withOpacity(0.8)
                      : colorScheme.inversePrimary.withOpacity(0.2),
                  titleColor: chooseExperienceController.items[1]
                      ? kLightBackgroundColor
                      : colorScheme.inversePrimary,
                  iconColor: chooseExperienceController.items[1]
                      ? kLightBackgroundColor
                      : colorScheme.inversePrimary,
                  faIcon: FaIcon(
                    FontAwesomeIcons.solidUser,
                    color: chooseExperienceController.items[1]
                        ? kLightBackgroundColor
                        : colorScheme.inversePrimary,
                  ),
                );
              },
            ),
            kSizedBox,
            Obx(
              () {
                return chooseExperienceAndroidButton(
                  media,
                  chooseExperienceController.navigateToAgent,
                  title: "Agent",
                  bgColor: chooseExperienceController.items[2]
                      ? kSuccessColor.withOpacity(0.8)
                      : colorScheme.inversePrimary.withOpacity(0.2),
                  titleColor: chooseExperienceController.items[2]
                      ? kLightBackgroundColor
                      : colorScheme.inversePrimary,
                  iconColor: chooseExperienceController.items[2]
                      ? kLightBackgroundColor
                      : colorScheme.inversePrimary,
                  faIcon: FaIcon(
                    FontAwesomeIcons.userTag,
                    color: chooseExperienceController.items[2]
                        ? kLightBackgroundColor
                        : colorScheme.inversePrimary,
                  ),
                );
              },
            ),
            kSizedBox,
          ],
        ),
      ),
    );
  }
}
