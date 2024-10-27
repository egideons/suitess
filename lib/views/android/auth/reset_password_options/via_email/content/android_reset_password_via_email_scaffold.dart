import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:suitess/constants/assets.dart';
import 'package:suitess/utils/components/responsive_constants.dart';

import '../../../../../../constants/consts.dart';
import '../../../../../../controllers/auth/reset_password_via_email_controller.dart';
import '../../../../../../utils/buttons/android/android_elevated_button.dart';
import '../../../../../../utils/containers/form_field_container.dart';
import '../../../../../../utils/text_form_fields/android/android_textformfield.dart';
import '../../content/android_reset_password_option_header.dart';

class AndroidResetPasswordViaEmailScaffold
    extends GetView<ResetPasswordViaEmailController> {
  const AndroidResetPasswordViaEmailScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    var colorScheme = Theme.of(context).colorScheme;

    final resetPasswordViaEmailController =
        ResetPasswordViaEmailController.instance;

    //Mobile Landscape mode or larger screens
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
                      androidResetPasswordOptionHeader(
                        colorScheme,
                        resetPasswordViaEmailController,
                        registeredOption: "email",
                        resetOption: "SMS",
                        resetVia: resetPasswordViaEmailController.navigateToSMS,
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
                            key: resetPasswordViaEmailController.formKey,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            child: Column(
                              children: [
                                formFieldContainer(
                                  colorScheme,
                                  media,
                                  containerHeight: media.height * .08,
                                  child: AndroidTextFormField(
                                    readOnly: resetPasswordViaEmailController
                                        .isLoading.value,
                                    controller:
                                        resetPasswordViaEmailController.emailEC,
                                    focusNode:
                                        resetPasswordViaEmailController.emailFN,
                                    textInputAction: TextInputAction.done,
                                    textCapitalization: TextCapitalization.none,
                                    keyboardType: TextInputType.emailAddress,
                                    hintText: "Email",
                                    onFieldSubmitted:
                                        resetPasswordViaEmailController
                                            .onSubmitted,
                                    onChanged: resetPasswordViaEmailController
                                        .emailOnChanged,
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
                      GetBuilder<ResetPasswordViaEmailController>(
                        init: ResetPasswordViaEmailController(),
                        builder: (context) {
                          return AndroidElevatedButton(
                            title: "Send code",
                            disable: resetPasswordViaEmailController
                                    .formIsValid.isTrue
                                ? false
                                : true,
                            isLoading:
                                resetPasswordViaEmailController.isLoading.value,
                            onPressed:
                                resetPasswordViaEmailController.submitEmail,
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
            androidResetPasswordOptionHeader(
              colorScheme,
              resetPasswordViaEmailController,
              registeredOption: "email",
              resetOption: "SMS",
              resetVia: resetPasswordViaEmailController.navigateToSMS,
            ),
            kSizedBox,
            Obx(
              () {
                return Form(
                  key: resetPasswordViaEmailController.formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      formFieldContainer(
                        colorScheme,
                        media,
                        child: AndroidTextFormField(
                          readOnly:
                              resetPasswordViaEmailController.isLoading.value,
                          controller: resetPasswordViaEmailController.emailEC,
                          focusNode: resetPasswordViaEmailController.emailFN,
                          textInputAction: TextInputAction.done,
                          textCapitalization: TextCapitalization.none,
                          keyboardType: TextInputType.emailAddress,
                          hintText: "Email",
                          onFieldSubmitted:
                              resetPasswordViaEmailController.onSubmitted,
                          onChanged:
                              resetPasswordViaEmailController.emailOnChanged,
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
            GetBuilder<ResetPasswordViaEmailController>(
              init: ResetPasswordViaEmailController(),
              builder: (context) {
                return AndroidElevatedButton(
                  title: "Send code",
                  disable: resetPasswordViaEmailController.formIsValid.isTrue
                      ? false
                      : true,
                  isLoading: resetPasswordViaEmailController.isLoading.value,
                  onPressed: resetPasswordViaEmailController.submitEmail,
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
