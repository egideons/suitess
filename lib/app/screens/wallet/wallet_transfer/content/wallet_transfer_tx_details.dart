import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../src/constants/consts.dart';
import '../../../../../src/controllers/app/wallet_transfer_controller.dart';
import '../../../../../src/utils/buttons/android/android_elevated_button.dart';
import '../../../../../src/utils/buttons/android/android_outlined_button.dart';
import '../../../../../theme/colors.dart';
import 'wallet_transfer_tx_detail.dart';

class WalletTransferTxDetails extends GetView<WalletTransferController> {
  const WalletTransferTxDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: Scrollbar(
          controller: controller.scrollController,
          child: GetBuilder<WalletTransferController>(
            init: WalletTransferController(),
            builder: (controller) {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Transaction Details",
                          textAlign: TextAlign.start,
                          style: defaultTextStyle(
                            color: kTextBoldHeadingColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Get.close(0);
                          },
                          icon: Icon(
                            Icons.close,
                            color: colorScheme.inversePrimary,
                            size: 18,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 20,
                      ),
                      decoration: ShapeDecoration(
                        color: kTransparentColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(
                            color: colorScheme.inversePrimary.withOpacity(.4),
                            width: 0.4,
                          ),
                        ),
                      ),
                      child: Column(
                        children: [
                          walletTransferTxDetail(
                            title: "Source account",
                            child: Text(
                              "093710254",
                              textAlign: TextAlign.end,
                              style: defaultTextStyle(
                                color: kTextBoldHeadingColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          kSizedBox,
                          walletTransferTxDetail(
                            title: "Benificiary Bank",
                            child: Text(
                              "Suitess Wallet",
                              textAlign: TextAlign.end,
                              style: defaultTextStyle(
                                color: kTextBoldHeadingColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          kSizedBox,
                          walletTransferTxDetail(
                            title: "Account Number",
                            child: Text(
                              "2062095204",
                              textAlign: TextAlign.end,
                              style: defaultTextStyle(
                                color: kTextBoldHeadingColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          kSizedBox,
                          walletTransferTxDetail(
                            title: "Benificiary's Name",
                            child: Text(
                              "Okigbo Ifeanyi",
                              textAlign: TextAlign.end,
                              style: defaultTextStyle(
                                color: kTextBoldHeadingColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          kSizedBox,
                          walletTransferTxDetail(
                            title: "Transaction Amount",
                            child: Text.rich(
                              softWrap: true,
                              TextSpan(
                                text: "$nairaSign ",
                                style: defaultTextStyle(
                                  color: kTextBoldHeadingColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  fontFamily: "",
                                ),
                                children: [
                                  TextSpan(
                                    text: doubleFormattedTextWithDecimal(20000),
                                    style: defaultTextStyle(
                                      color: kTextBoldHeadingColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          kSizedBox,
                          walletTransferTxDetail(
                            title: "Transaction Charges",
                            child: Text.rich(
                              softWrap: true,
                              TextSpan(
                                text: "$nairaSign ",
                                style: defaultTextStyle(
                                  color: kTextBoldHeadingColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  fontFamily: "",
                                ),
                                children: [
                                  TextSpan(
                                    text: doubleFormattedTextWithDecimal(52),
                                    style: defaultTextStyle(
                                      color: kTextBoldHeadingColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    kBigSizedBox,
                    AndroidOutlinedButton(
                      title: "Cancel",
                      onPressed: () {
                        Get.close(0);
                      },
                      borderColor: kAccentColor,
                      textColor: kAccentColor,
                      borderWidth: 1,
                    ),
                    kSizedBox,
                    AndroidElevatedButton(
                      title: "Confirm",
                      onPressed: controller.confirmTxDetails,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
