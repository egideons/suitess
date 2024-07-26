import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:suitess/src/constants/assets.dart';
import 'package:suitess/src/utils/components/my_app_bar.dart';
import 'package:suitess/theme/colors.dart';

import '../../../../../src/constants/consts.dart';
import '../../../../../src/controllers/app/search_screen_controller.dart';

class SearchScreenScaffold extends GetView<SearchScreenController> {
  const SearchScreenScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: myAppBar(
        colorScheme,
        media,
        leadingWidth: 34,
        automaticallyImplyLeading: false,
        titleWidget: CupertinoSearchTextField(
          autocorrect: true,
          keyboardType: TextInputType.text,
          suffixMode: OverlayVisibilityMode.editing,
          autofocus: true,
          enableIMEPersonalizedLearning: true,
          controller: controller.searchEC,
          placeholder: "Search",
          style: defaultTextStyle(
            color: kTextGreyColor,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          placeholderStyle: defaultTextStyle(
            color: colorScheme.primary.withOpacity(.5),
            fontWeight: FontWeight.normal,
          ),
          onSubmitted: (value) {},
          onChanged: (value) {},
        ),
      ),
      body: SafeArea(
        child: Scrollbar(
          child: ListView(
            padding: const EdgeInsets.all(10),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${formatIntNumber(492)} Results found",
                    textAlign: TextAlign.center,
                    style: defaultTextStyle(
                      color: kTextBoldHeadingColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(12),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          Assets.searchFilterSvg,
                          color: kAccentColor,
                        ),
                        kHalfWidthSizedBox,
                        Text(
                          "Filter",
                          textAlign: TextAlign.center,
                          style: defaultTextStyle(
                            color: kAccentColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              kSizedBox,
              Container(
                padding: const EdgeInsets.all(4),
                decoration: ShapeDecoration(
                  color: colorScheme.surface,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(
                      width: .5,
                      color: colorScheme.inversePrimary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
