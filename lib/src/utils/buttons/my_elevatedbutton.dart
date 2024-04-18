// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kribb/src/constants/consts.dart';

import '../../../../theme/colors.dart';

class MyElevatedButton extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  final bool isLoading;
  final bool disable;
  final String? fontFamily;
  final double? buttonElevation, fontSize;
  final bool? isRowVisible, isSwitched;
  final IconData? buttonIcon;
  final Color? buttonIconColor;
  final double? buttonIconSize;

  const MyElevatedButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.isLoading = false,
    this.disable = false,
    this.fontFamily,
    this.fontSize,
    this.buttonElevation,
    this.isRowVisible = false,
    this.buttonIcon,
    this.buttonIconColor,
    this.buttonIconSize,
    this.isSwitched,
  });

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return ElevatedButton(
      onPressed: disable
          ? null
          : isLoading
              ? null
              : onPressed,
      onLongPress: null,
      style: ElevatedButton.styleFrom(
        disabledBackgroundColor: kAccentColor.withOpacity(0.5),
        backgroundColor: kAccentColor,
        elevation: buttonElevation ?? 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        minimumSize: Size(media.width, 60),
      ),
      child: isLoading
          ? CircularProgressIndicator(color: kLightBackgroundColor)
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
