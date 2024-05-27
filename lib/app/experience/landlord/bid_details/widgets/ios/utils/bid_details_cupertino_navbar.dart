import 'package:flutter/cupertino.dart';
import 'package:suitess/src/constants/consts.dart';

bidDetailsCupertinoNavBar(
  colorScheme,
  media, {
  previousPageTitle,
  pageTitle,
  titleColor,
}) {
  return CupertinoNavigationBar(
    previousPageTitle: previousPageTitle ?? "",
    transitionBetweenRoutes: true,
    backgroundColor: colorScheme.surface,
    border: Border.all(color: colorScheme.surface),
    middle: SizedBox(
      width: media.width / 2,
      child: Text(
        pageTitle ?? "",
        textAlign: TextAlign.center,
        style: defaultTextStyle(
          color: titleColor ?? colorScheme.primary,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}
