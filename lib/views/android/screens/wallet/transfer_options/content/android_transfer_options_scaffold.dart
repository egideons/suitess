import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../../constants/assets.dart';
import '../../../../../../constants/consts.dart';
import '../../../../../../routes/routes.dart';
import '../../../../../../theme/colors.dart';
import '../../../../../../utils/components/my_app_bar.dart';
import 'android_transfer_option.dart';

class AndroidTransferOptionsScaffold extends StatelessWidget {
  const AndroidTransferOptionsScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    var colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: myAppBar(
        colorScheme,
        media,
        title: "Transfer",
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            SvgPicture.asset(Assets.androidPaymentMethod),
            kHalfSizedBox,
            Text(
              "Select a Destination bank",
              textAlign: TextAlign.center,
              style: defaultTextStyle(
                color: kTextBoldHeadingColor,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
            kBigSizedBox,
            androidTransferOption(
              colorScheme,
              icon: Assets.walletFilledIconSvg,
              title: "Wallet",
              selectOption: () {
                Get.toNamed(
                  Routes.walletTransfer,
                  preventDuplicates: true,
                );
              },
            ),
            kSizedBox,
            androidTransferOption(
              colorScheme,
              icon: Assets.bankBuildingSvg,
              title: "Bank Transfer",
              selectOption: () {
                Get.toNamed(
                  Routes.bankTransfer,
                  preventDuplicates: true,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
