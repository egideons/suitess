import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../../src/constants/assets.dart';
import '../../../../../../src/constants/consts.dart';
import '../../../../../../theme/colors.dart';

class LandLordHomeScreenScaffold extends StatelessWidget {
  const LandLordHomeScreenScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.background,
        automaticallyImplyLeading: true,
        leading: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: media.width / 3,
          decoration: ShapeDecoration(
            color: colorScheme.inversePrimary.withOpacity(0.4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
          ),
          child: Row(
            children: [
              FaIcon(
                FontAwesomeIcons.earthAmericas,
                color: colorScheme.inversePrimary,
                size: 12.0,
              ),
              kHalfWidthSizedBox,
              SizedBox(
                width: media.width / 5,
                child: Text(
                  "Enugu, Nigeria.",
                  overflow: TextOverflow.ellipsis,
                  style: defaultTextStyle(
                    fontSize: 10.0,
                    color: colorScheme.primary,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          SizedBox(
            height: 40,
            child: FittedBox(
              fit: BoxFit.contain,
              child: CircleAvatar(
                backgroundColor: colorScheme.inversePrimary,
                radius: 64,
                foregroundImage:
                    const NetworkImage(Assets.userPlaceholderImage),
                child: Text(
                  "P",
                  style: defaultTextStyle(
                    fontSize: 32.0,
                    color: kLightBackgroundColor,
                  ),
                ),
              ),
            ),
          ),
          kHalfWidthSizedBox,
          Container(
            decoration: ShapeDecoration(
              shape: CircleBorder(
                side: BorderSide(color: colorScheme.inversePrimary),
              ),
            ),
            child: CupertinoButton(
              onPressed: () {},
              padding: const EdgeInsets.all(0),
              alignment: Alignment.center,
              minSize: 38,
              borderRadius: BorderRadius.circular(100),
              child: Stack(
                children: [
                  FaIcon(
                    FontAwesomeIcons.bell,
                    color: colorScheme.primary.withOpacity(0.9),
                    size: 18,
                  ),
                  Positioned(
                    right: 0,
                    child: Container(
                      height: 10,
                      width: 10,
                      decoration: ShapeDecoration(
                        color: kErrorColor,
                        shape: const CircleBorder(),
                      ),
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
