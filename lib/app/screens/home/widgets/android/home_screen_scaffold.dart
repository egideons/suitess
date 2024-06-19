import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../src/constants/assets.dart';
import '../../../../../src/constants/consts.dart';

class HomeScreenScaffold extends StatelessWidget {
  const HomeScreenScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        automaticallyImplyLeading: true,
        title: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(24),
          child: Container(
            // margin: const EdgeInsets.all(10),
            width: media.width / 2.6,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
                side: BorderSide(
                  color: colorScheme.inversePrimary.withOpacity(0.2),
                ),
              ),
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  Assets.locationPinFilledIconSvg,
                  fit: BoxFit.contain,
                ),
                kHalfWidthSizedBox,
                Text(
                  "Enugu, Nigeria.",
                  overflow: TextOverflow.ellipsis,
                  style: defaultTextStyle(
                    fontSize: 10.0,
                    color: colorScheme.primary,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: colorScheme.inversePrimary,
                ),
              ],
            ),
          ),
        ),
        actions: [
          // SizedBox(
          //   height: 40,
          //   child: FittedBox(
          //     fit: BoxFit.contain,
          //     child: CircleAvatar(
          //       backgroundColor: colorScheme.inversePrimary,
          //       radius: 64,
          //       foregroundImage:
          //           const NetworkImage(Assets.userPlaceholderImage),
          //       child: Text(
          //         "P",
          //         style: defaultTextStyle(
          //           fontSize: 32.0,
          //           color: kLightBackgroundColor,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // kHalfWidthSizedBox,
          Container(
            margin: const EdgeInsets.only(right: 10),
            decoration: ShapeDecoration(
              shape: CircleBorder(
                side: BorderSide(
                  color: colorScheme.inversePrimary.withOpacity(0.2),
                ),
              ),
            ),
            child: IconButton(
              onPressed: () {},
              icon: Stack(
                children: [
                  SvgPicture.asset(
                    Assets.notificationBellOutlineSvg,
                    fit: BoxFit.contain,
                  ),
                  Positioned(
                    right: 3,
                    child: SvgPicture.asset(
                      height: 10,
                      Assets.redDotFilled,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: const [],
        ),
      ),
    );
  }
}
