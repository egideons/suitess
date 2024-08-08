import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../src/constants/assets.dart';
import '../../../../../src/constants/consts.dart';
import '../../../../../src/controllers/app/wallet_screen_controller.dart';
import '../../../../../theme/colors.dart';

walletCard(
  WalletScreenController controller, {
  String? walletBalance,
  String? acctNumber,
  String? bvn,
}) {
  return Expanded(
    child: Stack(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          height: 160,
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 14,
          ),
          decoration: ShapeDecoration(
            shadows: [
              BoxShadow(
                blurRadius: 7,
                spreadRadius: 0,
                color: kAccentColor.withOpacity(.2),
                offset: const Offset(0, 10),
              )
            ],
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                kWalletCardColor,
                kWalletCardColor.withOpacity(.6),
              ],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Available balance",
                    textAlign: TextAlign.start,
                    style: defaultTextStyle(
                      color: kTextWhiteColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Obx(
                    () {
                      return InkWell(
                        onTap: controller.changeVisibilityState,
                        borderRadius: BorderRadius.circular(100),
                        child: Icon(
                          controller.hideBalance.value
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: kLightBackgroundColor,
                          size: 18,
                        ),
                      );
                    },
                  ),
                ],
              ),
              Obx(
                () {
                  return RichText(
                    text: TextSpan(
                      text: "$nairaSign ",
                      style: defaultTextStyle(
                        color: kTextWhiteColor,
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                        fontFamily: "",
                      ),
                      children: [
                        TextSpan(
                          text: controller.hideBalance.value
                              ? maskWalletBalance(walletBalance ?? "")
                              : convertToCurrency(walletBalance ?? ""),
                          style: defaultTextStyle(
                            color: kTextWhiteColor,
                            fontWeight: FontWeight.w800,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              kBigSizedBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Acc Number",
                    textAlign: TextAlign.start,
                    style: defaultTextStyle(
                      color: kTextWhiteColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "BVN",
                    textAlign: TextAlign.start,
                    style: defaultTextStyle(
                      color: kTextWhiteColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      acctNumber ?? "",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                      style: defaultTextStyle(
                        color: kTextWhiteColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      maskBVN(bvn ?? ""),
                      textAlign: TextAlign.end,
                      overflow: TextOverflow.ellipsis,
                      style: defaultTextStyle(
                        color: kTextWhiteColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: 1.4,
          left: 1.4,
          child: SvgPicture.asset(
            Assets.walletCardEllipse1Svg,
            color: kStarColor,
          ),
        ),
        Positioned(
          bottom: 1.5,
          right: 1.4,
          child: SvgPicture.asset(
            Assets.walletCardEllipse2Svg,
            color: kStarColor,
          ),
        ),
      ],
    ),
  );
}
