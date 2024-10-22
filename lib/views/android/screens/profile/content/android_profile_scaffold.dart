import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/constants/consts.dart';
import 'package:suitess/main.dart';
import 'package:suitess/theme/colors.dart';
import 'package:suitess/utils/buttons/android/android_elevated_button.dart';
import 'package:suitess/views/android/screens/profile/content/android_account_information_section.dart';
import 'package:suitess/views/android/screens/profile/content/android_my_properties_section.dart';
import 'package:suitess/views/android/screens/profile/content/android_preferences_and_settings_section.dart';
import 'package:suitess/views/android/screens/profile/content/android_system_section.dart';
import 'package:suitess/views/android/screens/profile/content/android_user_image_name_id_section.dart';

import '../../../../../controllers/app/profile_screen_controller.dart';
import '../../../../../controllers/auth/user_controller.dart';
import 'android_profile_section_header.dart';

class AndroidProfileScreenScaffold extends GetView<ProfileScreenController> {
  const AndroidProfileScreenScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    // var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;
    var user = UserController.instance.userModel.value.data;
    var hasBusiness = prefs.getBool("hasBusiness") ?? false;
    // var businessIsLandsAndProperties =
    //     prefs.getBool("businessIsLandsAndProperties") ?? false;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: Scrollbar(
          controller: controller.scrollController,
          child: GetBuilder<ProfileScreenController>(
            init: ProfileScreenController(),
            builder: (controller) {
              return SingleChildScrollView(
                controller: controller.scrollController,
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 0,
                      child:
                          userImageNameIDSection(controller, colorScheme, user),
                    ),
                    kSizedBox,
                    androidProfileSectionHeader(title: "Account Information"),
                    kHalfSizedBox,
                    accountInformationSection(colorScheme),
                    kSizedBox,
                    androidProfileSectionHeader(title: "My Properties"),
                    kHalfSizedBox,
                    myPropertiesSection(colorScheme, hasBusiness, user),
                    kSizedBox,
                    androidProfileSectionHeader(
                      title: "Preferences and Settings",
                    ),
                    kHalfSizedBox,
                    preferencesAndSettingsSection(colorScheme),
                    kSizedBox,
                    androidProfileSectionHeader(title: "System"),
                    kHalfSizedBox,
                    systemSection(colorScheme),
                    kSizedBox,
                    AndroidElevatedButton(
                      title: "Logout",
                      isRowVisible: true,
                      isSwitched: true,
                      buttonIcon: Icons.logout,
                      buttonIconColor: kWhiteBackgroundColor,
                      mainAxisAlignment: MainAxisAlignment.center,
                      onPressed: controller.logout,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
