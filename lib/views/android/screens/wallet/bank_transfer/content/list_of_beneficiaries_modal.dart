import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/utils/components/my_app_bar.dart';

import '../../../../../../constants/consts.dart';
import '../../../../../../controllers/app/bank_transfer_controller.dart';
import '../../../../../../theme/colors.dart';
import '../../../../../../utils/components/circle_avatar_image.dart';

class ListOfBeneficiariesModal extends GetView<BankTransferController> {
  const ListOfBeneficiariesModal({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: myAppBar(
        colorScheme,
        media,
        title: "Beneficiaries",
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
            Expanded(
              child: Scrollbar(
                child: ListView.separated(
                  itemCount: 20,
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
                        controller.selectBeneficiary(index);
                      },
                      leading: circleAvatarImage(
                        colorScheme,
                        height: media.height * .12,
                        backgroundColor: kLightGreyColor.withOpacity(.4),
                        textColor: kSuccessColor,
                        foregroundImage: const AssetImage(""),
                        imageText:
                            getNameInitials(controller.beneficiaryModel.name),
                        radius: 60,
                      ),
                      title: Text(
                        controller.beneficiaryModel.name,
                        style: defaultTextStyle(
                          fontSize: 12,
                          color: kTextBoldHeadingColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      subtitle: Row(
                        children: [
                          Text(
                            controller.beneficiaryModel.bankName.toUpperCase(),
                            style: defaultTextStyle(
                              fontSize: 8,
                              color: kTextBoldHeadingColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          kSmallWidthSizedBox,
                          Container(
                            height: 4,
                            width: 4,
                            decoration: BoxDecoration(
                              color: kGreyColor,
                              shape: BoxShape.circle,
                            ),
                          ),
                          kSmallWidthSizedBox,
                          Expanded(
                            child: Text(
                              controller.beneficiaryModel.accountNumber,
                              style: defaultTextStyle(
                                fontSize: 8,
                                color: kTextBoldHeadingColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
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
