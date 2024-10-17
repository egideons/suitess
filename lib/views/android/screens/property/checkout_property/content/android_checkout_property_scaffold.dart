import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/constants/consts.dart';
import 'package:suitess/theme/colors.dart';
import 'package:suitess/utils/components/my_app_bar.dart';

import '../../../../../../controllers/app/checkout_property_controller.dart';
import '../../../../../../utils/buttons/android/android_elevated_button.dart';
import 'android_reference_checkout_apartment.dart';

class AndroidCheckoutPropertyScaffold
    extends GetView<CheckoutPropertyController> {
  final String? androidPaymentMethod;
  const AndroidCheckoutPropertyScaffold({this.androidPaymentMethod, super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: myAppBar(colorScheme, media, title: "Confirm checkout"),
      body: SafeArea(
        child: Scrollbar(
          child: ListView(
            controller: controller.scrollController,
            padding: const EdgeInsets.all(10),
            children: [
              Text(
                "Reference apartment:",
                style: defaultTextStyle(
                  color: kTextGreyColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              kHalfSizedBox,
              Container(
                padding: const EdgeInsets.all(10),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      width: .5,
                      color: colorScheme.inversePrimary.withOpacity(.4),
                    ),
                  ),
                ),
                child: androidReferenceCheckoutApartment(
                  colorScheme,
                  media,
                  propertyName: "4 Flats Woodland Apartment",
                  propertyLocation: "Independence layout, Enugu",
                  numOfBeds: 4,
                  numOfBaths: 2,
                  tradeType: "Rent",
                ),
              ),
              kSizedBox,
              Text(
                "Payment details:",
                style: defaultTextStyle(
                  color: kTextGreyColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              kHalfSizedBox,
              Container(
                padding: const EdgeInsets.all(10),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      width: .5,
                      color: colorScheme.inversePrimary.withOpacity(.4),
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            "Paying with:",
                            textAlign: TextAlign.start,
                            style: defaultTextStyle(
                              color: kTextBoldHeadingColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            androidPaymentMethod ?? "",
                            textAlign: TextAlign.end,
                            style: defaultTextStyle(
                              color: kTextBoldHeadingColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                    kSizedBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Amount:",
                          textAlign: TextAlign.start,
                          style: defaultTextStyle(
                            color: kTextBoldHeadingColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text.rich(
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
                                    text: formatIntNumber(350000),
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
                        ),
                      ],
                    ),
                    kSizedBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            "Discount",
                            textAlign: TextAlign.start,
                            style: defaultTextStyle(
                              color: kTextBoldHeadingColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "00.00",
                            textAlign: TextAlign.end,
                            style: defaultTextStyle(
                              color: kTextBoldHeadingColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                    kSizedBox,
                    Divider(color: colorScheme.inversePrimary.withOpacity(.4)),
                    kSmallSizedBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total:",
                          textAlign: TextAlign.start,
                          style: defaultTextStyle(
                            color: kTextBoldHeadingColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text.rich(
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
                                    text: formatIntNumber(350000),
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
                        ),
                      ],
                    ),
                    kSizedBox,
                  ],
                ),
              ),
              kBigSizedBox,
              AndroidElevatedButton(
                title: "Confirm",
                onPressed: () {
                  controller.showCongratulationsModalSheet(context, media);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
