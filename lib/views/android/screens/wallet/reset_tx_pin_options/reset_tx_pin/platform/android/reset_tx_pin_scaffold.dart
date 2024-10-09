import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:suitess/constants/assets.dart';
import 'package:suitess/constants/consts.dart';
import 'package:suitess/controllers/app/reset_tx_pin_controller.dart';
import 'package:suitess/utils/buttons/android/android_elevated_button.dart';
import 'package:suitess/utils/components/my_app_bar.dart';
import 'package:suitess/utils/components/responsive_constants.dart';
import 'package:suitess/views/android/screens/wallet/reset_tx_pin_options/reset_tx_pin/content/reset_tx_pin_landscape_form.dart';
import 'package:suitess/views/android/screens/wallet/reset_tx_pin_options/reset_tx_pin/content/reset_tx_pin_page_header.dart';

class ResetTxPinScaffold extends GetView<ResetTxPinController> {
  const ResetTxPinScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    //Large screens or Mobile Landscape mode
    if (deviceType(media.width) > 1) {
      return Scaffold(
        backgroundColor: colorScheme.surface,
        appBar: myAppBar(colorScheme, media),
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: media.width / 2,
              child: Wrap(
                alignment: WrapAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        Assets.otpSvg,
                        fit: BoxFit.cover,
                        height: deviceType(media.width) > 2
                            ? media.height * .4
                            : media.height * .3,
                      ),
                      kSizedBox,
                      resetTxPinPageHeader(colorScheme, media),
                    ],
                  ),
                ],
              ),
            ),
            kHalfWidthSizedBox,
            //OTP Form
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: colorScheme.surface,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      width: 1,
                      color: colorScheme.inversePrimary,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const SizedBox(height: kDefaultPadding * 4),
                      resetTxPinLandscapeForm(
                        controller,
                        colorScheme,
                        media,
                        context,
                      ),
                      kSizedBox,
                      const SizedBox(height: kDefaultPadding * 2),
                      GetBuilder<ResetTxPinController>(
                        builder: (controller) {
                          return AndroidElevatedButton(
                            title: "Verify",
                            isLoading:
                                controller.isLoading.value ? true : false,
                            disable:
                                controller.formIsValid.value ? false : true,
                            onPressed: controller.submitTXPIN,
                          );
                        },
                      ),
                      const SizedBox(height: kDefaultPadding * 2),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return Scaffold(
        appBar: myAppBar(colorScheme, media),
        body: const Center(
          child: Text('Scaffold Body'),
        ),
      );
    }
  }
}
