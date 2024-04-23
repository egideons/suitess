import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kribb/app/kyc/kyc_profile_photo/content/kyc_profile_photo_page_header.dart';
import 'package:kribb/app/kyc/kyc_profile_photo/widgets/ios/kyc_profile_photo_cupertino_modal_popup.dart';
import 'package:kribb/src/controllers/kyc_profile_photo_controller.dart';
import 'package:kribb/src/utils/containers/form_field_container.dart';
import 'package:kribb/theme/colors.dart';

import '../../../../../src/constants/consts.dart';
import '../../../../auth/components/auth_cupertino_nav_bar.dart';

class KycProfilePhotoCupertinoScaffold
    extends GetView<KycProfilePhotoController> {
  const KycProfilePhotoCupertinoScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    var kycProfilePhotoController = KycProfilePhotoController.instance;

    return CupertinoPageScaffold(
      navigationBar: authCupertinoNavBar(
        colorScheme: colorScheme,
        media: media,
        title: "Profile",
        faIcon: FaIcon(
          FontAwesomeIcons.solidCircleUser,
          color: kSuccessColor,
          size: 12,
        ),
      ),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            kycProfilePhotoPageHeader(
              colorScheme: colorScheme,
              media: media,
              title: "Upload your profile photo",
              subtitle: "Personalise your profile with a picture of yourself!",
            ),
            const SizedBox(height: kDefaultPadding * 2),
            formFieldContainer(
              colorScheme,
              media,
              containerHeight: media.height * 0.08,
              child: CupertinoButton(
                onPressed: () {
                  kycProfilePhotoCupertinoModalPopup(
                    context,
                    media,
                    colorScheme,
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.circlePlus,
                        color: colorScheme.inversePrimary,
                      ),
                      kWidthSizedBox,
                      Text(
                        "Upload Photo",
                        style: defaultTextStyle(
                          fontSize: 14.0,
                          color: colorScheme.inversePrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
