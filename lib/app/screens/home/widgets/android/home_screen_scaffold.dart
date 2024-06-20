import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:typewritertext/v3/typewriter.dart';

import '../../../../../src/constants/consts.dart';
import '../../../../../src/controllers/app/homescreen_controller.dart';
import '../../../../../src/routes/routes.dart';
import '../../../../../src/utils/containers/form_field_container.dart';
import 'components/alert_message.dart';
import 'components/app_bar.dart';

class HomeScreenScaffold extends StatelessWidget {
  const HomeScreenScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    var controller = HomescreenController.instance;

    // if (deviceType(media.width) > 2) {
    //   return Scaffold(
    //     backgroundColor: colorScheme.surface,
    //     appBar: homeAppBar(
    //       colorScheme,
    //       media,
    //       "Enugu, Nigeria.",
    //       goToNotifications: () {
    //         Get.toNamed(Routes.notificationsScreen, preventDuplicates: true);
    //       },
    //     ),
    //     body: SafeArea(
    //       child: ListView(
    //         padding: const EdgeInsets.all(10),
    //         children: const [],
    //       ),
    //     ),
    //   );
    // }

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: homeAppBar(
        colorScheme,
        media,
        "Enugu, Nigeria.",
        goToNotifications: () {
          Get.toNamed(Routes.notificationsScreen, preventDuplicates: true);
        },
      ),
      body: SafeArea(
        child: RefreshIndicator.adaptive(
          onRefresh: controller.onRefresh,
          child: Scrollbar(
            controller: controller.scrollController,
            child: GetBuilder<HomescreenController>(
              init: HomescreenController(),
              builder: (controller) {
                return ListView(
                  controller: controller.scrollController,
                  padding: const EdgeInsets.all(10),
                  children: [
                    TypeWriter.text(
                      "Manage your \nproperties with ease",
                      style: defaultTextStyle(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                      duration: const Duration(milliseconds: 100),
                    ),
                    kSizedBox,
                    formFieldContainer(
                      colorScheme,
                      media,
                      child: CupertinoSearchTextField(
                        autocorrect: true,
                        backgroundColor: colorScheme.surface,
                        enableIMEPersonalizedLearning: true,
                        controller: controller.searchController,
                        placeholder: "Search",
                        placeholderStyle: defaultTextStyle(
                          color: colorScheme.primary.withOpacity(.5),
                          fontWeight: FontWeight.normal,
                        ),
                        onSubmitted: (value) {},
                        onChanged: (value) {},
                      ),
                    ),
                    kSizedBox,
                    controller.isKYCVerified.value
                        ? Column(
                            children: [
                              messageAlertAndroid(
                                media,
                                message: "KYC not verified",
                              ),
                              const SizedBox(height: kDefaultPadding * 1.4),
                              // kSizedBox,
                            ],
                          )
                        : const SizedBox(),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
