import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kribb/src/utils/text_form_fields/android/android_textformfield.dart';

import '../../../../../src/constants/consts.dart';
import '../../../../../src/controllers/signup_controller.dart';
import '../../../../../src/utils/containers/form_field_container.dart';
import '../../../../../theme/colors.dart';
import '../../../components/auth_app_bar.dart';
import '../../content/signup_page_header.dart';

class SignupScaffold extends GetView<SignupController> {
  const SignupScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    final signupController = SignupController.instance;

    return Scaffold(
      appBar: authAppBar(
        colorScheme: colorScheme,
        media: media,
        title: "Create account",
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            signupPageHeader(colorScheme: colorScheme, media: media),
            const SizedBox(height: kDefaultPadding * 2),
            Obx(
              () {
                return Form(
                  key: signupController.formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      formFieldContainer(
                        colorScheme,
                        media,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: media.width - 80,
                              child: AndroidTextFormField(
                                controller: signupController.firstNameEC,
                                focusNode: signupController.firstNameFN,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.name,
                                textCapitalization: TextCapitalization.words,
                                hintText: "First Name",
                                onChanged: signupController.firstNameOnChanged,
                                alignLabelWithHint: true,
                                validator: (value) {
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: signupController.isFirstNameValid.value
                                  ? FaIcon(
                                      FontAwesomeIcons.solidCircleCheck,
                                      color: kSuccessColor,
                                    )
                                  : FaIcon(
                                      FontAwesomeIcons.solidCircleXmark,
                                      color: kErrorColor,
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
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: media.width - 80,
                              child: AndroidTextFormField(
                                hintText: "Last Name",
                                controller: signupController.lastNameEC,
                                focusNode: signupController.lastNameFN,
                                textInputAction: TextInputAction.next,
                                textCapitalization: TextCapitalization.words,
                                keyboardType: TextInputType.name,
                                onChanged: signupController.lastNameOnChanged,
                                validator: (value) {
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: signupController.isLastNameValid.value
                                  ? FaIcon(
                                      FontAwesomeIcons.solidCircleCheck,
                                      color: kSuccessColor,
                                    )
                                  : FaIcon(
                                      FontAwesomeIcons.solidCircleXmark,
                                      color: kErrorColor,
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
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: media.width - 80,
                              child: AndroidTextFormField(
                                controller: signupController.emailEC,
                                focusNode: signupController.emailFN,
                                hintText: "Email",
                                textInputAction: TextInputAction.next,
                                textCapitalization: TextCapitalization.none,
                                keyboardType: TextInputType.emailAddress,
                                onChanged: signupController.emailOnChanged,
                                validator: (value) {
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: signupController.isEmailValid.value
                                  ? FaIcon(
                                      FontAwesomeIcons.solidCircleCheck,
                                      color: kSuccessColor,
                                    )
                                  : FaIcon(
                                      FontAwesomeIcons.solidCircleXmark,
                                      color: kErrorColor,
                                    ),
                            ),
                          ],
                        ),
                      ),
                      kSizedBox,
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
