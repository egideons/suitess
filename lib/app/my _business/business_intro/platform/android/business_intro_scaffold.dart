import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../src/constants/assets.dart';
import '../../../../../src/constants/consts.dart';
import '../../../../../src/controllers/app/business_intro_controller.dart';
import '../../../../../theme/colors.dart';
import '../../content/business_intro_page_1.dart';

class BusinessIntroScaffold extends GetView<BusinessIntroController> {
  const BusinessIntroScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: PageView(
        controller: controller.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          businessIntroPage1(colorScheme, controller),
          businessIntroPage2(colorScheme, controller),
          businessIntroPage3(colorScheme, controller),
        ],
      ),
    );
  }

  businessIntroPage2(
    ColorScheme colorScheme,
    BusinessIntroController controller,
  ) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            width: .5,
            color: colorScheme.inversePrimary.withOpacity(.4),
          ),
        ),
      ),
      child: Column(
        children: [
          Text(
            "Choose your preferred business category",
            textAlign: TextAlign.center,
            style: defaultTextStyle(
              color: kTextBoldHeadingColor,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          kSizedBox,
          businessCategoryOption(
            colorScheme,
            image: Assets.landsAndPropertiesPng,
            title: "Lands and Properties",
            subtitle:
                "Advertise and manage sales, rentals, or leases for lands, apartments, workspaces, shops, and more.",
          ),
          kSizedBox,
          businessCategoryOption(
            colorScheme,
            image: Assets.hotelBuildingPng,
            title: "Hotel Management",
            subtitle:
                "List your hotels for bookings and manage all your hotel activities effortlessly.",
          ),
          kSizedBox,
        ],
      ),
    );
  }

  businessCategoryOption(
    ColorScheme colorScheme, {
    void Function()? onTap,
    String? image,
    String? title,
    String? subtitle,
  }) {
    return InkWell(
      onTap: onTap ?? () {},
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              width: .5,
              color: colorScheme.inversePrimary.withOpacity(.4),
            ),
          ),
        ),
        child: Row(
          children: [
            Image.asset(image ?? Assets.landsAndPropertiesPng),
            Column(
              children: [
                Text(
                  title ?? "",
                  textAlign: TextAlign.start,
                  style: defaultTextStyle(
                    color: kTextBoldHeadingColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  subtitle ?? "",
                  textAlign: TextAlign.start,
                  style: defaultTextStyle(
                    color: kTextBoldHeadingColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  businessIntroPage3(
    ColorScheme colorScheme,
    BusinessIntroController controller,
  ) {
    return Form(
      key: controller.formKey,
      child: const Column(
        children: [],
      ),
    );
  }
}
