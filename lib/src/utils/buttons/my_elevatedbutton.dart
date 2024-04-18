// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
        disabledBackgroundColor: kPrimaryColor.withOpacity(0.5),
        backgroundColor: kPrimaryColor,
        elevation: buttonElevation ?? 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        minimumSize: Size(media.width, 60),
      ),
      child: isLoading
          ? CircularProgressIndicator(color: kAccentColor)
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
                          style: TextStyle(
                            color: kTextWhiteColor,
                            fontSize: fontSize ?? 18,
                            fontFamily: fontFamily,
                            fontWeight: FontWeight.w900,
                            letterSpacing: -0.40,
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
                          style: TextStyle(
                            color: kTextWhiteColor,
                            fontSize: fontSize ?? 18,
                            fontFamily: fontFamily,
                            fontWeight: FontWeight.w900,
                            letterSpacing: -0.40,
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
                  style: TextStyle(
                    color: kTextWhiteColor,
                    fontSize: fontSize ?? 18,
                    fontFamily: fontFamily,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.40,
                  ),
                ),
    );
  }
}
