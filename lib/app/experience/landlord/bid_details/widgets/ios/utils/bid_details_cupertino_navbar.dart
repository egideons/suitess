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
    backgroundColor: colorScheme.background,
    border: Border.all(color: colorScheme.background),
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
