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
  final IconData? buttonIcon;
  final Color? color, buttonIconColor;
  final double? buttonIconSize;

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
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return CupertinoButton(
      borderRadius: BorderRadius.circular(24),
      minSize: 60,
      color: color ?? kAccentColor,
      disabledColor: colorScheme.inversePrimary,
      onPressed: disable
          ? null
          : isLoading
              ? null
              : onPressed,
      child: isLoading
          ? CupertinoActivityIndicator(color: colorScheme.inversePrimary)
          : isRowVisible == true
              ? isSwitched == true
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FaIcon(
                          buttonIcon,
                          color: buttonIconColor,
                          size: buttonIconSize ?? 16,
                        ),
                        Text(
                          title,
                          textAlign: TextAlign.center,
                          style: defaultTextStyle(
                            color: kTextWhiteColor,
                            fontSize: fontSize ?? 18.0,
                            fontFamily: fontFamily,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          textAlign: TextAlign.center,
                          style: defaultTextStyle(
                            color: kTextWhiteColor,
                            fontSize: fontSize ?? 18.0,
                            fontFamily: fontFamily,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        FaIcon(
                          buttonIcon,
                          color: buttonIconColor,
                          size: buttonIconSize ?? 16,
                        ),
                      ],
                    )
              : Text(
                  title,
                  textAlign: TextAlign.center,
                  style: defaultTextStyle(
                    color: kTextWhiteColor,
                    fontSize: fontSize ?? 16.0,
                    fontFamily: fontFamily,
                    fontWeight: FontWeight.w900,
                  ),
                ),
    );
  }
}
