import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/src/controllers/app/airtime_controller.dart';
import 'package:suitess/src/utils/components/my_app_bar.dart';

import '../../../../../src/constants/assets.dart';
import '../../../../../src/constants/consts.dart';
import '../../../../../theme/colors.dart';

class ListOfAirtimeBillersModal extends GetView<AirtimePurchaseController> {
  const ListOfAirtimeBillersModal({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: myAppBar(
        colorScheme,
        media,
        title: "Select Biller",
        leading: Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: IconButton(
            tooltip: "Cancel",
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
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              child: CupertinoSearchTextField(
                autocorrect: true,
                keyboardType: TextInputType.text,
                suffixMode: OverlayVisibilityMode.editing,
                autofocus: true,
                enableIMEPersonalizedLearning: true,
                controller: controller.billerSearchEC,
                focusNode: controller.billerSearchFN,
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
            Expanded(
              child: Scrollbar(
                child: ListView.separated(
                  itemCount: controller.airtimeBillers.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      Padding(
                    padding: const EdgeInsets.all(4),
                    child: Divider(
                      color: kLightGreyColor,
                      indent: 10,
                      endIndent: 10,
                    ),
                  ),
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        controller.selectBiller(index);
                      },
                      leading: Image.asset(
                        Assets.yellowAppLogo,
                        height: 32,
                      ),
                      title: Text(
                        controller.airtimeBillers[index].name,
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
            SizedBox(height: media.height * .04),
          ],
        ),
      ),
    );
  }
}
