import 'package:flutter/material.dart';
import 'package:suitess/theme/colors.dart';

Widget loadingIndicator({media}) {
  return SizedBox(
    width: media.width,
    height: 2,
    child: LinearProgressIndicator(color: kAccentColor),
  );
}
