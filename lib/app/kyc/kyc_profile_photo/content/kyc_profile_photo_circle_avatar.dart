import 'package:flutter/material.dart';
import 'package:kribb/src/constants/consts.dart';

Widget kycProfilePhotoCircleAvatar(colorScheme, initials, {image}) {
  return CircleAvatar(
    backgroundColor: colorScheme.inversePrimary,
    radius: 64,
    foregroundImage: image != null ? FileImage(image) : null,
    child: Text(
      initials,
      style: defaultTextStyle(
        fontSize: 32.0,
      ),
    ),
  );
}
