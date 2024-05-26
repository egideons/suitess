// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:suitess/src/constants/consts.dart';

import '../../../theme/colors.dart';

class ApiProcessorController extends GetxController {
  static Future<dynamic> errorState(data) async {
    try {
      if (data.statusCode == 200) {
        return data.body;
      }
      // errorSnack("Something went wrong");
      return;
    } catch (e) {
      // errorSnack("Check your internet and try again");
      return;
    }
  }

  static void successSnack(msg) {
    Get.showSnackbar(
      GetSnackBar(
        titleText: SizedBox(
          width: Get.width,
          child: Text(
            "SUCCESS",
            overflow: TextOverflow.ellipsis,
            style: defaultTextStyle(
              color: kLightBackgroundColor,
              fontSize: 18.0,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        messageText: SizedBox(
          width: Get.width,
          child: Text(
            msg,
            overflow: TextOverflow.ellipsis,
            maxLines: 4,
            style: defaultTextStyle(
              color: kLightBackgroundColor,
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        icon: Icon(
          Icons.check_circle,
          size: 16,
          color: kLightBackgroundColor,
        ),
        shouldIconPulse: true,
        isDismissible: true,
        backgroundColor: kSuccessColor,
        barBlur: 2.0,
        borderRadius: 10,
        snackPosition: SnackPosition.TOP,
        // backgroundGradient: LinearGradient(
        //   colors: [kSuccessColor, kSuccessColor.withOpacity(0.6)],
        // ),
        margin: const EdgeInsets.all(10),
        duration: const Duration(seconds: 2),
        mainButton: IconButton(
          onPressed: () {
            Get.back();
          },
          color: kLightBackgroundColor,
          icon: const FaIcon(
            FontAwesomeIcons.solidCircleXmark,
            size: 14,
          ),
        ),
      ),
    );
  }

  static void errorSnack(msg) {
    Get.showSnackbar(
      GetSnackBar(
        titleText: SizedBox(
          width: Get.width,
          child: Text(
            "ERROR",
            overflow: TextOverflow.ellipsis,
            style: defaultTextStyle(
              color: kLightBackgroundColor,
              fontSize: 18.0,
              fontWeight: FontWeight.w900,
              letterSpacing: -0.40,
            ),
          ),
        ),
        messageText: SizedBox(
          width: Get.width,
          child: Text(
            msg,
            overflow: TextOverflow.ellipsis,
            maxLines: 4,
            style: defaultTextStyle(
              color: kLightBackgroundColor,
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
              letterSpacing: -0.40,
            ),
          ),
        ),
        icon: Icon(
          Icons.error_rounded,
          size: 18,
          color: kLightBackgroundColor,
        ),
        shouldIconPulse: true,
        isDismissible: true,
        barBlur: 2.0,
        borderRadius: 10,
        snackPosition: SnackPosition.TOP,
        // backgroundGradient: LinearGradient(
        //   colors: [kSuccessColor, kSuccessColor.withOpacity(0.6)],
        // ),
        margin: const EdgeInsets.all(10),
        backgroundColor: kErrorColor,
        duration: const Duration(seconds: 2),
        mainButton: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: FaIcon(
            FontAwesomeIcons.solidCircleXmark,
            size: 14,
            color: kLightBackgroundColor,
          ),
        ),
      ),
    );
  }
}
