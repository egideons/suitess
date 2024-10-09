import 'package:flutter/material.dart';

import '../../../../../../../constants/assets.dart';
import '../../../../../../../constants/consts.dart';
import '../../../../../../../controllers/app/wallet_information_controller.dart';
import '../../../../../../../theme/colors.dart';

walletTierInfo(
  ColorScheme colorScheme,
  WalletInformationController controller, {
  bool? isCurrentTier,
  String? tierType,
  String? maxSingleTransfer,
  String? dailyTransactionLimit,
  String? maximumAccountBalance,
}) {
  return Container(
    decoration: ShapeDecoration(
      color: kTransparentColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color:
              isCurrentTier ?? false ? kTransparentColor : colorScheme.primary,
          width: 0.2,
        ),
      ),
    ),
    child: Column(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.all(10),
          decoration: ShapeDecoration(
            color: isCurrentTier ?? false ? kSuccessColor : colorScheme.surface,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isCurrentTier ?? false
                  ? Image.asset(Assets.goldBadge3DPng, height: 20)
                  : const SizedBox(),
              kSmallWidthSizedBox,
              Text(
                tierType ?? "",
                style: defaultTextStyle(
                  color: kTextBoldHeadingColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.all(10),
          decoration: ShapeDecoration(
            color: isCurrentTier ?? false
                ? kGreenFrameBackgroundColor
                : colorScheme.surface,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "Max single transfer",
                      style: defaultTextStyle(
                        color: kTextGreyColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Text(
                    maxSingleTransfer ?? "",
                    style: defaultTextStyle(
                      color: kTextBoldHeadingColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              kSizedBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "Daily Transaction Limit",
                      style: defaultTextStyle(
                        color: kTextGreyColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Text(
                    dailyTransactionLimit ?? "",
                    style: defaultTextStyle(
                      color: kTextBoldHeadingColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              kSizedBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "Maximum Account Balance",
                      style: defaultTextStyle(
                        color: kTextGreyColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Text(
                    maximumAccountBalance ?? "",
                    style: defaultTextStyle(
                      color: kTextBoldHeadingColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
