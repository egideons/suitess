import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:suitess/src/constants/assets.dart';
import 'package:suitess/src/utils/components/responsive_constants.dart';

import '../../../../../../src/constants/consts.dart';
import '../../../../../../src/controllers/auth/forgot_password_via_email_controller.dart';
import '../../../../../../src/utils/buttons/android/android_elevated_button.dart';
import '../../../../../../src/utils/containers/form_field_container.dart';
import '../../../../../../src/utils/text_form_fields/android/android_textformfield.dart';
import '../../../content/reset_password_option_header.dart';

class ResetPasswordViaEmailScaffold
    extends GetView<ResetPasswordViaEmailController> {
  const ResetPasswordViaEmailScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    final resetPasswordViaEmailController =
        ResetPasswordViaEmailController.instance;

    //Mobile Landscape mode or larger screens
    if (deviceType(media.width) > 1) {
      return Scaffold(
        backgroundColor: colorScheme.surface,
        body: Row(
          children: [
            SizedBox(
              width: media.width / 2.2,
              child: Column(
                children: [
                  Container(),
                ],
              ),
            )
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
            resetPasswordOptionHeader(
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
