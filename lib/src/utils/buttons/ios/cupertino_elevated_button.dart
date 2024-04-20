import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../theme/colors.dart';
import '../../../constants/consts.dart';

class CupertinoElevatedButton extends StatelessWidget {
  final String title;
  final Function() onPressed;
  final bool isLoading;
  final bool disable;
  final String? fontFamily;
  final double? fontSize;
  final bool? isRowVisible, isSwitched;
  final MainAxisAlignment? mainAxisAlignment;
  final IconData? buttonIcon;
  final Color? buttonColor, indicatorColor, textColor, buttonIconColor;
  final double? buttonIconSize;
  final Widget? buttonIconWidget;
  final FontWeight? fontWeight;

  const CupertinoElevatedButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.isLoading = false,
    this.disable = false,
    this.fontFamily,
    this.fontSize,
    this.isRowVisible,
    this.isSwitched,
    this.buttonIcon,
    this.buttonIconColor,
    this.buttonIconSize,
    this.buttonColor,
    this.buttonIconWidget,
    this.indicatorColor,
    this.textColor,
    this.mainAxisAlignment,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return CupertinoButton(
      borderRadius: BorderRadius.circular(24),
      minSize: 60,
      color: buttonColor ?? kAccentColor,
      disabledColor: colorScheme.inversePrimary,
      onPressed: disable
          ? null
          : isLoading
              ? null
              : onPressed,
      child: isLoading
          ? CupertinoActivityIndicator(color: colorScheme.primary)
          : isRowVisible == true
              ? isSwitched == true
                  ? Row(
                      mainAxisAlignment:
                          mainAxisAlignment ?? MainAxisAlignment.spaceBetween,
                      children: [
                        buttonIconWidget ??
                            FaIcon(
                              buttonIcon,
                              color: buttonIconColor,
                              size: buttonIconSize ?? 14,
                            ),
                        mainAxisAlignment == null
                            ? const SizedBox()
                            : kHalfWidthSizedBox,
                        Text(
                          title,
                          textAlign: TextAlign.center,
                          style: defaultTextStyle(
                            color: textColor ?? kTextWhiteColor,
                            fontSize: fontSize ?? 14.0,
                            fontFamily: fontFamily,
                            fontWeight: fontWeight ?? FontWeight.w600,
                          ),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment:
                          mainAxisAlignment ?? MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          textAlign: TextAlign.center,
                          style: defaultTextStyle(
                            color: textColor ?? kTextWhiteColor,
                            fontSize: fontSize ?? 14.0,
                            fontFamily: fontFamily,
                            fontWeight: fontWeight ?? FontWeight.w600,
                          ),
                        ),
                        mainAxisAlignment == null
                            ? const SizedBox()
                            : kHalfWidthSizedBox,
                        buttonIconWidget ??
                            FaIcon(
                              buttonIcon,
                              color: buttonIconColor,
                              size: buttonIconSize ?? 14,
                            ),
                      ],
                    )
              : Text(
                  title,
                  textAlign: TextAlign.center,
                  style: defaultTextStyle(
                    color: textColor ?? kTextWhiteColor,
                    fontSize: fontSize ?? 14.0,
                    fontFamily: fontFamily,
                    fontWeight: fontWeight ?? FontWeight.w600,
                  ),
                ),
    );
  }
}
