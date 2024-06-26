import 'package:flutter/cupertino.dart';
import 'package:suitess/src/utils/components/responsive_constants.dart';

import '../../../../../src/constants/consts.dart';

void showKYCChooseCountryModalPopup(
  context,
  colorScheme,
  media,
  controller,
) {
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
        height:
            deviceType(media.width) > 1 ? media.height * .6 : media.height * .3,
        child: CupertinoScrollbar(
          controller: controller.fixedContentScrollController.value,
          child: CupertinoPicker.builder(
            itemExtent: deviceType(media.width) > 1 ? 60 : 40,
            useMagnifier: true,
            childCount: controller.countries.length,
            scrollController: controller.fixedContentScrollController.value,
            onSelectedItemChanged: (index) {
              controller.onSelectedCountryChanged(controller, index);
            },
            itemBuilder: (context, index) {
              return Center(
                child: Text(
                  controller.countries[index],
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
