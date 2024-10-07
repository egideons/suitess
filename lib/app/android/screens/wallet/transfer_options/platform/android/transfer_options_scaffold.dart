import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../../../src/constants/assets.dart';
import '../../../../../../../src/constants/consts.dart';
import '../../../../../../../src/routes/routes.dart';
import '../../../../../../../src/utils/components/my_app_bar.dart';
import '../../../../../../../theme/colors.dart';
import '../../content/transfer_option.dart';

class TransferOptionsScaffold extends StatelessWidget {
  const TransferOptionsScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
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
            SvgPicture.asset(Assets.paymentMethod),
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
            transferOption(
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
            transferOption(
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
