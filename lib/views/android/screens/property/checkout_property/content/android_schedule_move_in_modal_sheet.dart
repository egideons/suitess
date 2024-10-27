import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/utils/buttons/android/android_elevated_button.dart';
import 'package:suitess/utils/components/my_app_bar.dart';

import '../../../../../../constants/consts.dart';
import '../../../../../../controllers/app/checkout_property_controller.dart';
import '../../../../../../theme/colors.dart';
import 'android_schedule_move_in_date_calendar.dart';

class AndroidScheduleMoveInModalSheet
    extends GetView<CheckoutPropertyController> {
  const AndroidScheduleMoveInModalSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    var colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: myAppBar(
        colorScheme,
        media,
        leadingIsVisible: false,
        bottom: myAppBar(
          colorScheme,
          media,
          leadingIsVisible: false,
          title: "Move-in Date",
          centerTitle: true,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Date",
                    textAlign: TextAlign.center,
                    style: defaultTextStyle(
                      color: kTextBoldHeadingColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  kSizedBox,
                  Container(
                    decoration: ShapeDecoration(
                      color: colorScheme.surface,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          width: .2,
                          color: colorScheme.inversePrimary,
                        ),
                      ),
                      shadows: [
                        BoxShadow(
                          blurRadius: 2,
                          spreadRadius: 0,
                          color: colorScheme.inversePrimary.withOpacity(.2),
                          offset: const Offset(0, 2),
                        )
                      ],
                    ),
                    child: androidScheduleMoveInDateCalendar(
                        controller, colorScheme),
                  ),
                  kSizedBox,
                  Container(
                    padding: const EdgeInsets.all(4),
                    width: media.width,
                    decoration: ShapeDecoration(
                      color: kBannerBackgroundColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: Text(
                      "Important notice",
                      textAlign: TextAlign.start,
                      style: defaultTextStyle(
                        color: kBannerTextColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  kHalfSizedBox,
                  RichText(
                    text: TextSpan(
                      text:
                          "Our support team will contact you to arrange the details. If you have any question, our support team is here to help. ",
                      style: defaultTextStyle(
                        color: kTextBoldHeadingColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                      children: [
                        TextSpan(
                          recognizer: TapGestureRecognizer()..onTap = () {},
                          text: "Contact Support",
                          style: defaultTextStyle(
                            color: colorScheme.secondary,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  kBigSizedBox,
                  AndroidElevatedButton(
                    title: "Schedule",
                    onPressed: () {
                      controller.showScheduleMoveInCongratulationsModalSheet(
                        context,
                        media,
                      );
                    },
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
