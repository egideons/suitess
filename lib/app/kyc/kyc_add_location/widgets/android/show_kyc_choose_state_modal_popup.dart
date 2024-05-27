import 'package:flutter/cupertino.dart';

import '../../../../../src/constants/consts.dart';

void showKYCChooseStateModalPopup(context, colorScheme, media, controller) {
  showCupertinoModalPopup(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return Container(
        decoration: ShapeDecoration(
          color: colorScheme.surface,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
        ),
        height: media.height * 0.3,
        child: CupertinoScrollbar(
          controller: controller.fixedContentScrollController.value,
          child: CupertinoPicker.builder(
            itemExtent: 40,
            useMagnifier: true,
            childCount: controller.nigerianStates.length,
            scrollController: controller.fixedContentScrollController.value,
            onSelectedItemChanged: (index) {
              controller.onSelectedStateChanged(controller, index);
            },
            itemBuilder: (context, index) {
              return Center(
                child: Text(
                  controller.nigerianStates[index],
                  style: defaultTextStyle(
                    fontSize: 14.0,
                    color: colorScheme.primary,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              );
            },
          ),
        ),
      );
    },
  );
}
