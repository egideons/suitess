import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:suitess/src/models/wallet/transaction_filter_month_model.dart';
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
              onTap: controller.toggleTransactionHistoryFilter,
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
                return Stack(
                  children: [
                    Container(
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
                    ),
                    Positioned(
                      top: 0,
                      child: Obx(
                        () {
                          return Visibility(
                            visible: controller
                                .transactionHistoryFilterIsVisible.value,
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                              padding: const EdgeInsets.all(10),
                              width: media.width,
                              height:
                                  //  controller.filterTabs.first.isSelected
                                  //     ? media.height * .48
                                  //     :
                                  media.height * .56,
                              decoration: ShapeDecoration(
                                color: colorScheme.surface,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    bottom: Radius.circular(8),
                                  ),
                                ),
                                shadows: [
                                  BoxShadow(
                                    color: colorScheme.inversePrimary
                                        .withOpacity(.2),
                                    offset: const Offset(0, 4),
                                    blurRadius: 10,
                                    spreadRadius: 2,
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  transactionFilterTabs(controller),
                                  Expanded(
                                    child: Obx(() {
                                      // Split the list into two equal parts
                                      final firstHalf = controller.filterMonths
                                          .take(6)
                                          .toList();
                                      final secondHalf = controller.filterMonths
                                          .skip(6)
                                          .toList();
                                      return PageView(
                                        controller: controller
                                            .transactionHistoryFilterPageController,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        children: [
                                          txFilterByCategoriesPage(controller),
                                          buildMonthSelection(
                                            firstHalf,
                                            controller,
                                            secondHalf,
                                          ),
                                        ],
                                      );
                                    }),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  buildMonthSelection(
    List<TransactionFilterMonthModel> firstHalf,
    WalletScreenController controller,
    List<TransactionFilterMonthModel> secondHalf,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // First Column
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: firstHalf.map((month) {
              return ListTile(
                title: Text(
                  month.name,
                  style: TextStyle(
                    fontSize: 16,
                    color: month.isSelected ? Colors.green : Colors.black,
                    fontWeight:
                        month.isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
                trailing: month.isSelected
                    ? const Icon(Icons.check, color: Colors.green, size: 20)
                    : null,
                onTap: () {
                  controller.selectMonth(month.name);
                },
              );
            }).toList(),
          ),
        ),
        // Second Column
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: secondHalf.map((month) {
              return ListTile(
                title: Text(
                  month.name,
                  style: TextStyle(
                    fontSize: 16,
                    color: month.isSelected ? Colors.green : Colors.black,
                    fontWeight:
                        month.isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
                trailing: month.isSelected
                    ? const Icon(Icons.check, color: Colors.green, size: 20)
                    : null,
                onTap: () {
                  controller.selectMonth(month.name);
                },
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Row transactionFilterTabs(WalletScreenController controller) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        controller.filterTabs.length,
        (index) => TextButton(
          onPressed: () {
            controller.selectFilterTab(index);
          },
          child: Text(
            controller.filterTabs[index].name,
            style: defaultTextStyle(
              color: controller.filterTabs[index].isSelected
                  ? kSuccessColor
                  : kTextBoldHeadingColor,
              fontSize: 14,
              decoration: controller.filterTabs[index].isSelected
                  ? TextDecoration.underline
                  : TextDecoration.none,
              decorationColor: kSuccessColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  txFilterByCategoriesPage(WalletScreenController controller) {
    return Column(
      children: List.generate(
        controller.filterCategories.length,
        (index) {
          var filterCategoryTab = controller.filterCategories[index];
          return ListTile(
            onTap: () => controller.selectFilterCategories(index),
            title: Text(
              filterCategoryTab.name,
              style: defaultTextStyle(
                color: kTextBoldHeadingColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: filterCategoryTab.isSelected
                ? Icon(
                    Icons.check,
                    color: kSuccessColor,
                  )
                : const SizedBox(),
          );
        },
      ),
    );
  }
}
