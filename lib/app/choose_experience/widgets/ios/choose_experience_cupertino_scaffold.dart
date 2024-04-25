import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kribb/app/choose_experience/content/choose_experience_page_header.dart';

import '../../../../src/constants/consts.dart';
import '../../../../src/controllers/choose_experience_controller.dart';

class ChooseExperienceCupertinoScaffold
    extends GetView<ChooseExperienceController> {
  const ChooseExperienceCupertinoScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    var chooseExperienceController = ChooseExperienceController.instance;

    return CupertinoPageScaffold(
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            chooseExperiencePageHeader(
              colorScheme: colorScheme,
              media: media,
              title: "Choose your experience",
              subtitle:
                  "Are you a Landlord/Vendor, Tenant/Buyer, or an Agent?\nWe have just the right platform for you",
            ),
            const SizedBox(height: kDefaultPadding * 2),
          ],
        ),
      ),
    );
  }
}
