import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:suitess/src/constants/consts.dart';
import 'package:suitess/theme/colors.dart';

kycProfilePhotoCupertinoModalPopup(context, media, colorScheme, controller) {
  return showCupertinoModalPopup(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return Container(
        padding: const EdgeInsets.all(20),
        decoration: ShapeDecoration(
          color: colorScheme.background,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
        ),
        child: Row(
          children: [
            CupertinoButton(
              onPressed: () {
                Get.back();
                controller.pickImage(source: ImageSource.camera);
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: ShapeDecoration(
                      shape: CircleBorder(
                        side: BorderSide(
                          color: colorScheme.inversePrimary,
                          width: .5,
                        ),
                      ),
                    ),
                    child: Center(
                      child: FaIcon(
                        FontAwesomeIcons.camera,
                        color: kAccentColor,
                      ),
                    ),
                  ),
                  kHalfSizedBox,
                  Text(
                    "Camera",
                    style: defaultTextStyle(
                      color: colorScheme.primary,
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
            ),
            kHalfWidthSizedBox,
            CupertinoButton(
              onPressed: () {
                Get.back();
                controller.pickImage(source: ImageSource.gallery);
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: ShapeDecoration(
                      shape: CircleBorder(
                        side: BorderSide(
                          color: colorScheme.inversePrimary,
                          width: .5,
                        ),
                      ),
                    ),
                    child: Center(
                      child: FaIcon(
                        FontAwesomeIcons.solidImages,
                        color: kAccentColor,
                      ),
                    ),
                  ),
                  kHalfSizedBox,
                  Text(
                    "Photos",
                    style: defaultTextStyle(
                      color: colorScheme.primary,
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
