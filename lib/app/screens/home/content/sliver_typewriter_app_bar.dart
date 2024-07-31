import 'package:flutter/material.dart';
import 'package:typewritertext/v3/typewriter.dart';

import '../../../../src/constants/consts.dart';
import '../../../../theme/colors.dart';

sliverTypWriterTextAppBar() {
  return SliverAppBar(
    elevation: 0,
    toolbarHeight: 70,
    flexibleSpace: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TypeWriter.text(
        duration: const Duration(milliseconds: 100),
        "Manage your \nproperties with ease",
        style: defaultTextStyle(
          color: kTextBoldHeadingColor,
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
      ),
    ),
  );
}
