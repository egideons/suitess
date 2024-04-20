import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kribb/theme/colors.dart';

import '../../../src/constants/consts.dart';
import '../../../src/controllers/login_controller.dart';
import '../signup/screen/signup.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize signup controller
    Get.put(LoginController());

    var colorScheme = Theme.of(context).colorScheme;

    if (Platform.isIOS) {
      return GestureDetector(
        onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
        child: Container(
          color: kLightBackgroundColor,
          child: Align(
            alignment: Alignment.center,
            child: Text.rich(
              TextSpan(
                text: "Don't have an account? ",
                style: defaultTextStyle(
                  color: colorScheme.primary,
                  fontSize: 16.0,
                ),
                children: [
                  TextSpan(
                    text: "Sign up",
                    mouseCursor: SystemMouseCursors.click,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Navigate to Home() screen
                        Get.offAll(
                          () => const Signup(),
                          routeName: "/signup",
                          fullscreenDialog: true,
                          curve: Curves.easeInOut,
                          predicate: (routes) => false,
                          popGesture: false,
                          transition: Get.defaultTransition,
                        );
                      },
                    style: defaultTextStyle(
                      color: kAccentColor,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const Scaffold(),
    );
  }
}
