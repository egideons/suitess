import 'package:flutter/material.dart';

import '../../../../../src/constants/consts.dart';
import '../../../../../theme/colors.dart';

walletTransferTxDetail({String? title, Widget? child}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title ?? "",
        textAlign: TextAlign.start,
        style: defaultTextStyle(
          color: kTextGreyColor,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
      kWidthSizedBox,
      Expanded(
        child: Align(
          alignment: Alignment.centerRight,
          child: child ?? Container(),
        ),
      ),
    ],
  );
}
