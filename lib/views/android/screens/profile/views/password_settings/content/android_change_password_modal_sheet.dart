import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:suitess/utils/components/my_app_bar.dart';

import '../../../../../../../constants/consts.dart';
import '../../../../../../../controllers/app/password_settings_controller.dart';
import '../../../../../../../theme/colors.dart';
import '../../../../../../../utils/buttons/android/android_elevated_button.dart';
import '../../../../../../../utils/containers/form_field_container.dart';
import '../../../../../../../utils/text_form_fields/android/android_textformfield.dart';

class AndroidChangePasswordModalSheet
    extends GetView<PasswordSettingsController> {
  const AndroidChangePasswordModalSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: myAppBar(
        colorScheme,
        media,
        title: "Change Password",
        leading: Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: IconButton(
            tooltip: "Cancel",
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.close,
              size: 20,
              color: kAppBarIconColor,
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          Obx(
            () {
              return Form(
                key: controller.formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    formFieldContainer(
                      colorScheme,
                      media,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: AndroidTextFormField(
                              readOnly: controller.isLoading.value,
                              controller: controller.currentPasswordEC,
                              focusNode: controller.currentPasswordFN,
                              textInputAction: TextInputAction.next,
                              textCapitalization: TextCapitalization.none,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText:
                                  controller.currentPasswordIsHidden.value,
                              hintText: "Enter old Password",
                              onChanged: controller.currentPasswordOnChanged,
                              validator: (value) {
                                return null;
                              },
                            ),
                          ),
                          InkWell(
                            borderRadius: BorderRadius.circular(20),
                            onTap: () {
                              controller.currentPasswordIsHidden.value =
                                  !controller.currentPasswordIsHidden.value;
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                color: colorScheme.inversePrimary,
                                size: 14,
                                controller.currentPasswordIsHidden.value
                                    ? Iconsax.eye4
                                    : Iconsax.eye_slash5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    kSizedBox,
                    formFieldContainer(
                      colorScheme,
                      media,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: AndroidTextFormField(
                              readOnly: controller.isLoading.value,
                              controller: controller.passwordEC,
                              focusNode: controller.passwordFN,
                              textInputAction: TextInputAction.next,
                              textCapitalization: TextCapitalization.none,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: controller.passwordIsHidden.value,
                              hintText: "Enter new Password",
                              onChanged: controller.passwordOnChanged,
                              validator: (value) {
                                return null;
                              },
                            ),
                          ),
                          InkWell(
                            borderRadius: BorderRadius.circular(20),
                            onTap: () {
                              controller.passwordIsHidden.value =
                                  !controller.passwordIsHidden.value;
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                color: colorScheme.inversePrimary,
                                size: 14,
                                controller.passwordIsHidden.value
                                    ? Iconsax.eye4
                                    : Iconsax.eye_slash5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        controller.isTypingPassword.isFalse
                            ? ""
                            : controller.isPasswordValid.value
                                ? "Password meets the requirements"
                                : "Password must contain 8 characters\n a number\n a special character.",
                        textAlign: TextAlign.end,
                        style: defaultTextStyle(
                          color: controller.isPasswordValid.value
                              ? kSuccessColor
                              : kErrorColor,
                          fontSize: 10,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    kHalfSizedBox,
                    formFieldContainer(
                      colorScheme,
                      media,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: AndroidTextFormField(
                              readOnly: controller.isLoading.value,
                              controller: controller.confirmPasswordEC,
                              focusNode: controller.confirmPasswordFN,
                              textInputAction: TextInputAction.done,
                              textCapitalization: TextCapitalization.none,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText:
                                  controller.confirmPasswordIsHidden.value,
                              hintText: "Confirm new Password",
                              onChanged: controller.confirmPasswordOnChanged,
                              onFieldSubmitted: controller.onSubmitted,
                              validator: (value) {
                                return null;
                              },
                            ),
                          ),
                          InkWell(
                            borderRadius: BorderRadius.circular(20),
                            onTap: () {
                              controller.confirmPasswordIsHidden.value =
                                  !controller.confirmPasswordIsHidden.value;
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                color: colorScheme.inversePrimary,
                                size: 14,
                                controller.confirmPasswordIsHidden.value
                                    ? Iconsax.eye4
                                    : Iconsax.eye_slash5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: kDefaultPadding * 2),
          GetBuilder<PasswordSettingsController>(
            init: PasswordSettingsController(),
            builder: (context) {
              return Obx(
                () => AndroidElevatedButton(
                  title: "Save Changes",
                  disable: controller.formIsValid.value,
                  isLoading: controller.isLoading.value,
                  onPressed: controller.updatePassword,
                ),
              );
            },
          ),
          SizedBox(height: media.height * .04),
        ],
      ),
    );
  }
}
