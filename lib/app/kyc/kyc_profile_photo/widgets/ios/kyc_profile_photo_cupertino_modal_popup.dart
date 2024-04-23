import 'package:flutter/cupertino.dart';

kycProfilePhotoCupertinoModalPopup(context, media, colorScheme) {
  return showCupertinoModalPopup(
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
      );
    },
  );
}
