import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:suitess/constants/assets.dart';
import 'package:suitess/controllers/app/reset_tx_pin_via_sms_controller.dart';
import 'package:suitess/utils/components/responsive_constants.dart';

import '../../../../../../../../constants/consts.dart';
import '../../../../../../../../utils/buttons/android/android_elevated_button.dart';
import '../../../../../../../../utils/containers/form_field_container.dart';
import '../../../../../../../../utils/text_form_fields/android/android_textformfield.dart';
import '../../../content/reset_tx_pin_option_header.dart';

class ResetTxPinViaSmsScaffold extends GetView<ResetTxPinViaSmsController> {
  const ResetTxPinViaSmsScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    //Landscape mode or larger screens
    if (deviceType(media.width) > 1) {
      return Scaffold(
        backgroundColor: colorScheme.surface,
        appBar: AppBar(
          backgroundColor: colorScheme.surface,
          toolbarHeight: 36,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Iconsax.arrow_left_2,
              color: colorScheme.primary,
            ),
          ),
        ),
        body: Row(
          children: [
            SizedBox(
              width: media.width / 2.2,
              child: Wrap(
                alignment: WrapAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        Assets.passwordSvg,
                        fit: BoxFit.fitHeight,
                        height: deviceType(media.width) > 2
                            ? media.height * .4
                            : media.height * .2,
                      ),
                      kSizedBox,
                      resetTxPinOptionHeader(
                        colorScheme,
                        controller,
                        registeredOption: "phone number",
                        resetOption: "Email",
                        resetVia: controller.navigateToEmail,
                      ),
                      kSizedBox,
                    ],
                  ),
                ],
              ),
            ),
            kHalfWidthSizedBox,

            //Form
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.only(right: 10),
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
                      Obx(
                        () {
                          return Form(
                            key: controller.formKey,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            child: Column(
                              children: [
                                formFieldContainer(
                                  colorScheme,
                                  media,
                                  containerHeight: media.height * .08,
                                  child: AndroidTextFormField(
                                    readOnly: controller.isLoading.value,
                                    controller: controller.phoneNumberEC,
                                    focusNode: controller.phoneNumberFN,
                                    textInputAction: TextInputAction.done,
                                    textCapitalization: TextCapitalization.none,
                                    keyboardType: TextInputType.phone,
                                    hintText: "Phone number",
                                    onFieldSubmitted: controller.onSubmitted,
                                    onChanged: controller.phoneNumberOnChanged,
                                    validator: (value) {
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: kDefaultPadding * 2),
                      GetBuilder<ResetTxPinViaSmsController>(
                        init: ResetTxPinViaSmsController(),
                        builder: (context) {
                          return AndroidElevatedButton(
                            title: "Send code",
                            disable:
                                controller.formIsValid.isTrue ? false : true,
                            isLoading: controller.isLoading.value,
                            onPressed: controller.submitPhoneNumber,
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
    }

    //Mobile Portrait mode
    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Iconsax.arrow_left_2,
            color: colorScheme.primary,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            SvgPicture.asset(
              Assets.passwordSvg,
              fit: BoxFit.fitHeight,
              height: media.height * .24,
            ),
            kSizedBox,
            resetTxPinOptionHeader(
              colorScheme,
              controller,
              registeredOption: "mobile number",
              resetOption: "Email",
              resetVia: controller.navigateToEmail,
            ),
            kSizedBox,
            Obx(
              () {
                return Form(
                  key: controller.formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      formFieldContainer(
                        colorScheme,
                        media,
                        child: AndroidTextFormField(
                          readOnly: controller.isLoading.value,
                          controller: controller.phoneNumberEC,
                          focusNode: controller.phoneNumberFN,
                          textInputAction: TextInputAction.done,
                          textCapitalization: TextCapitalization.none,
                          keyboardType: TextInputType.phone,
                          hintText: "Phone number",
                          onFieldSubmitted: controller.onSubmitted,
                          onChanged: controller.phoneNumberOnChanged,
                          validator: (value) {
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: kDefaultPadding * 2),
            GetBuilder<ResetTxPinViaSmsController>(
              init: ResetTxPinViaSmsController(),
              builder: (context) {
                return AndroidElevatedButton(
                  title: "Send code",
                  disable: controller.formIsValid.isTrue ? false : true,
                  isLoading: controller.isLoading.value,
                  onPressed: controller.submitPhoneNumber,
                );
              },
            ),
            const SizedBox(height: kDefaultPadding * 2),
          ],
        ),
      ),
    );
  }
}
