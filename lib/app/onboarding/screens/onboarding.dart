import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kribb/src/constants/consts.dart';
import 'package:kribb/theme/colors.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          backgroundColor:
              Get.isDarkMode ? kDarkBackgroundColor : kLightBackgroundColor,
          middle: Text(
            "Onboarding",
            overflow: TextOverflow.ellipsis,
            style: defaultTextStyle(fontSize: 18.0),
          ),
        ),
        child: CupertinoScrollbar(
          child: ListView(
            children: const [],
          ),
        ),
      );
    }
    return Scaffold(
      body: SafeArea(
        child: Scrollbar(
          child: ListView(
            children: const [],
          ),
        ),
      ),
    );
  }
}
