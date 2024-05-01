import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kribb/src/constants/consts.dart';
import 'package:kribb/theme/colors.dart';

import '../../../../../../src/controllers/landlord_homescreen_controller.dart';
import '../../../../../../src/utils/containers/form_field_container.dart';
import 'landlord_homescreen_cupertino_navbar.dart';

class LandLordHomeScreenCupertinoScaffold extends StatelessWidget {
  const LandLordHomeScreenCupertinoScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    var controller = LandlordHomescreenController.instance;

    return CupertinoPageScaffold(
      navigationBar: landLordHomeScreenCupertinoNavBar(
        colorScheme: colorScheme,
        media: media,
      ),
      child: SafeArea(
        child: RefreshIndicator.adaptive(
          onRefresh: controller.onRefresh,
          child: CupertinoScrollbar(
            child: ListView(
              padding: const EdgeInsets.all(10),
              children: [
                SizedBox(
                  width: media.width / 3,
                  child: Text.rich(
                    TextSpan(
                      text: "Manage your\nproperties with ",
                      style: defaultTextStyle(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.normal,
                        fontSize: 14.0,
                      ),
                      children: [
                        TextSpan(
                          text: "ease.",
                          style: defaultTextStyle(
                            color: kAccentColor,
                            fontWeight: FontWeight.normal,
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                kSizedBox,
                formFieldContainer(
                  colorScheme,
                  media,
                  child: CupertinoSearchTextField(
                    controller: controller.searchController,
                    backgroundColor: kTransparentColor,
                    placeholder: "Tap to explore",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
