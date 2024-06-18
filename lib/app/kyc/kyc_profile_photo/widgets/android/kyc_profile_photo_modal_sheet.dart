import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:suitess/src/constants/consts.dart';
import 'package:suitess/theme/colors.dart';

kycProfilePhotoModalSheet(context, media, colorScheme, controller) {
  return showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        padding: const EdgeInsets.all(20),
        decoration: ShapeDecoration(
          color: colorScheme.surface,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
        ),
        child: Row(
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(100),
              onTap: () {
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
                      child: Icon(
                        Icons.camera,
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
            kWidthSizedBox,
            InkWell(
              borderRadius: BorderRadius.circular(100),
              onTap: () {
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
                      child: Icon(
                        Icons.image,
                        color: kAccentColor,
                      ),
                    ),
                  ),
                  kHalfSizedBox,
                  Text(
                    "Gallery",
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
