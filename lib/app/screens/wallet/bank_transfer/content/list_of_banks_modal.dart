import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/src/utils/components/my_app_bar.dart';

import '../../../../../src/constants/assets.dart';
import '../../../../../src/constants/consts.dart';
import '../../../../../src/controllers/app/bank_transfer_controller.dart';
import '../../../../../theme/colors.dart';

class ListOfBanksModal extends GetView<BankTransferController> {
  const ListOfBanksModal({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: myAppBar(
        colorScheme,
        media,
        title: "Select Bank",
        leading: Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: IconButton(
            tooltip: "Go back",
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.close,
              size: 20,
              color: kAppBarIconColor,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: CupertinoSearchTextField(
                autocorrect: true,
                keyboardType: TextInputType.text,
                suffixMode: OverlayVisibilityMode.editing,
                autofocus: true,
                enableIMEPersonalizedLearning: true,
                controller: controller.bankSearchEC,
                focusNode: controller.bankSearchFN,
                placeholder: "Search",
                style: defaultTextStyle(
                  color: kTextGreyColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                placeholderStyle: defaultTextStyle(
                  color: colorScheme.primary.withOpacity(.5),
                  fontWeight: FontWeight.normal,
                ),
                onSubmitted: (value) {},
                onChanged: (value) {},
              ),
            ),
            kBigSizedBox,
            Expanded(
              child: Scrollbar(
                child: ListView.separated(
                  itemCount: 20,
                  separatorBuilder: (BuildContext context, int index) =>
                      Padding(
                    padding: const EdgeInsets.all(4),
                    child: Divider(
                      color: colorScheme.inversePrimary,
                    ),
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: Image.asset(Assets.yellowAppLogo, height: 32),
                      title: Text(
                        "Bank of Nigeria".toUpperCase(),
                        style: defaultTextStyle(
                          fontSize: 12,
                          color: kTextBoldHeadingColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
