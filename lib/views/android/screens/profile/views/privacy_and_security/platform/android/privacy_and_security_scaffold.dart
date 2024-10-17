import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/constants/consts.dart';
import 'package:suitess/utils/components/my_app_bar.dart';

import '../../../../../../../../controllers/app/privacy_and_security_controller.dart';
import '../../../../../../../../theme/colors.dart';
import '../../content/privacy_option.dart';
import '../../content/toggle_option.dart';

class PrivacyAndSecurityScaffold extends GetView<PrivacyAndSecurityController> {
  const PrivacyAndSecurityScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: myAppBar(colorScheme, media, title: "Privacy"),
      body: SafeArea(
        child: Scrollbar(
          controller: controller.scrollController,
          child: GetBuilder<PrivacyAndSecurityController>(
            init: PrivacyAndSecurityController(),
            builder: (controller) {
              return ListView(
                controller: controller.scrollController,
                padding: const EdgeInsets.all(10),
                children: [
                  Container(
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                          width: 1,
                          color: colorScheme.inversePrimary.withOpacity(.4),
                        ),
                      ),
                    ),
                    child: Column(
                      children: [
                        Obx(
                          () => privacyOption(
                            colorScheme,
                            context,
                            controller,
                            title: "Profile Visibility",
                            isPublic: controller.profileIsPublic.value,
                            isPrivate: controller.profileIsPrivate.value,
                            onTapPrivate:
                                controller.selectPrivateProfileVisibility,
                            onTapPublic:
                                controller.selectPublicProfileVisisbility,
                          ),
                        ),
                        Divider(
                          color: colorScheme.inversePrimary.withOpacity(.4),
                          height: 0,
                        ),
                        Obx(
                          () => privacyOption(
                            colorScheme,
                            context,
                            controller,
                            title: "Listed Properties",
                            isPublic: controller.listedPropertiesIsPublic.value,
                            isPrivate:
                                controller.listedPropertiesIsPrivate.value,
                            onTapPrivate: controller
                                .selectPrivateListedPropertiesVisibility,
                            onTapPublic: controller
                                .selectPublicListedPropertiesVisibility,
                          ),
                        ),
                        Obx(
                          () => privacyOption(
                            colorScheme,
                            context,
                            controller,
                            title: "Activity Status",
                            isPublic: controller.activityStatusIsPublic.value,
                            isPrivate: controller.activityStatusIsPrivate.value,
                            onTapPrivate: controller
                                .selectPrivateActivityStatusVisibility,
                            onTapPublic:
                                controller.selectPublicActivityStatusVisibility,
                          ),
                        ),
                      ],
                    ),
                  ),
                  kBigSizedBox,
                  Container(
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                          width: 1,
                          color: colorScheme.inversePrimary.withOpacity(.4),
                        ),
                      ),
                    ),
                    child: Obx(
                      () => privacyOption(
                        colorScheme,
                        context,
                        controller,
                        title: "Client Interaction Visibility",
                        isPublic: controller.clientInteractionIsPublic.value,
                        isPrivate: controller.clientInteractionIsPrivate.value,
                        onTapPrivate:
                            controller.selectPrivateClientInteractionVisibility,
                        onTapPublic:
                            controller.selectPublicClientInteractionVisibility,
                      ),
                    ),
                  ),
                  Obx(
                    () => controller.clientInteractionIsPrivate.value
                        ? const SizedBox()
                        : Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "This will allow users to see reviews and ratings from your clients",
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 10,
                              style: defaultTextStyle(
                                color: kTextGreyColor,
                                fontSize: 8,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                  ),
                  kBigSizedBox,
                  androidToggleOption(
                    colorScheme,
                    title: "Third Party Sharing",
                    value: controller.thirdPartySharingIsEnabled.value,
                    onChanged: controller.toggleThirdPartySharing,
                  ),
                  Obx(
                    () => controller.thirdPartySharingIsEnabled.value
                        ? Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "This will allow the app to share your data with partner services for enhanced functionality.",
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 10,
                              style: defaultTextStyle(
                                color: kTextGreyColor,
                                fontSize: 8,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        : const SizedBox(),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
