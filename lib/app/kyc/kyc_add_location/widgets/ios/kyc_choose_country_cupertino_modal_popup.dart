import 'package:flutter/cupertino.dart';

import '../../../../../src/constants/consts.dart';

void showKYCChooseCountryCupertinoPopup(
    context, colorScheme, media, controller) {
  showCupertinoModalPopup(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return Container(
        decoration: ShapeDecoration(
          color: colorScheme.background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        height: media.height * 0.3,
        child: CupertinoScrollbar(
          controller: controller.fixedContentScrollController.value,
          child: CupertinoPicker.builder(
            itemExtent: 40,
            childCount: controller.countries.length,
            scrollController: controller.fixedContentScrollController.value,
            onSelectedItemChanged: (index) {
              controller.selectedCountry.value = controller.countries[index];
            },
            itemBuilder: (context, index) {
              return Center(
                child: Text(
                  controller.countries[index],
                  style: defaultTextStyle(),
                ),
              );
            },
          ),
        ),
      );
    },
  );
}
