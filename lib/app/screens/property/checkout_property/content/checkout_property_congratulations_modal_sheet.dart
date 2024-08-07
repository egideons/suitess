import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:suitess/src/constants/assets.dart';
import 'package:suitess/src/utils/buttons/android/android_elevated_button.dart';
import 'package:suitess/src/utils/components/my_app_bar.dart';

import '../../../../../src/constants/consts.dart';
import '../../../../../src/controllers/app/checkout_property_controller.dart';
import '../../../../../theme/colors.dart';

class CheckoutPropertyCongratulationsModalSheet
    extends GetView<CheckoutPropertyController> {
  const CheckoutPropertyCongratulationsModalSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: myAppBar(
        colorScheme,
        media,
        leadingIsVisible: false,
        bottom: myAppBar(
          colorScheme,
          media,
          title: "",
          leadingIsVisible: false,
        ),
      ),
      body: Scrollbar(
        controller: controller.scrollController,
        child: GetBuilder<CheckoutPropertyController>(
          init: CheckoutPropertyController(),
          builder: (controller) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(Assets.congratulationsSvg),
                  kSizedBox,
                  Text(
                    "Congratulations",
                    textAlign: TextAlign.center,
                    style: defaultTextStyle(
                      color: kTextBoldHeadingColor,
                      fontWeight: FontWeight.w800,
                      fontSize: 24,
                    ),
                  ),
                  kSizedBox,
                  Text(
                    "Welcome to your new home! Thank you for choosing Suitess. We’re excited to be a part  of your journey!.",
                    textAlign: TextAlign.center,
                    maxLines: 10,
                    style: defaultTextStyle(
                      color: kTextBoldHeadingColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                  kBigSizedBox,
                  AndroidElevatedButton(
                    title: "Schedule move-in",
                    onPressed: () {},
                  ),
                  kHalfSizedBox,
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Download receipt",
                      textAlign: TextAlign.center,
                      maxLines: 10,
                      style: defaultTextStyle(
                        color: kAccentColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
