import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:suitess/src/utils/components/my_app_bar.dart';

import '../../../../../src/constants/assets.dart';
import '../../../../../src/constants/consts.dart';
import '../../../../../src/controllers/app/wallet_screen_controller.dart';
import '../../../../../theme/colors.dart';
import 'recent_transaction.dart';

class TransactionsHistoryModalSheet extends GetView<WalletScreenController> {
  const TransactionsHistoryModalSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: myAppBar(
        colorScheme,
        media,
        leadingIsVisible: false,
        bottom: myAppBar(
          colorScheme,
          media,
          title: "Transaction History",
          leadingIsVisible: true,
          actions: [
            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(12),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
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
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: RefreshIndicator.adaptive(
          onRefresh: controller.onRefresh,
          backgroundColor: colorScheme.surface,
          color: colorScheme.primary,
          child: Scrollbar(
            controller: controller.scrollController,
            child: GetBuilder<WalletScreenController>(
              init: WalletScreenController(),
              builder: (controller) {
                return Container(
                  margin: const EdgeInsets.all(10),
                  decoration: ShapeDecoration(
                    color: colorScheme.surface,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    shadows: [
                      BoxShadow(
                        color: colorScheme.inversePrimary.withOpacity(.2),
                        offset: const Offset(0, 4),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: ListView.separated(
                    controller: controller.scrollController,
                    itemCount: 20,
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    separatorBuilder: (context, index) => kHalfSizedBox,
                    itemBuilder: (context, index) {
                      return recentTransaction(
                        media,
                        () {},
                        title: "Alonso Diobi",
                        dateTime: DateTime.now(),
                        amount: 29000,
                        isSuccessful: true,
                        isIncome: true,
                        isCancelled: false,
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}