import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kribb/app/choose_experience/content/choose_experience_page_header.dart';
import 'package:kribb/app/choose_experience/widgets/ios/experience_button.dart';
import 'package:kribb/theme/colors.dart';

import '../../../../src/constants/consts.dart';
import '../../../../src/controllers/choose_experience_controller.dart';

class ChooseExperienceCupertinoScaffold
    extends GetView<ChooseExperienceController> {
  const ChooseExperienceCupertinoScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    var chooseExperienceController = ChooseExperienceController.instance;

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        previousPageTitle: "Profile",
        transitionBetweenRoutes: true,
        backgroundColor: colorScheme.background,
        border: Border.all(color: kTransparentColor),
      ),
      child: SafeArea(
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
                return experienceButton(
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
                return experienceButton(
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
                return experienceButton(
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
