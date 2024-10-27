import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/utils/components/my_app_bar.dart';

import '../../../../../../../controllers/app/contact_details_controller.dart';
import '../../../../../../../controllers/auth/user_controller.dart';
import 'android_edit_detail.dart';
import 'android_email_section.dart';

class AndroidContactDetailsScaffold
    extends GetView<ContactDetailsScreenController> {
  const AndroidContactDetailsScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    var colorScheme = Theme.of(context).colorScheme;

    var user = UserController.instance.userModel.value.data;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: myAppBar(colorScheme, media, title: "Contact details"),
      body: SafeArea(
        child: Scrollbar(
          controller: controller.scrollController,
          child: GetBuilder<ContactDetailsScreenController>(
            init: ContactDetailsScreenController(),
            builder: (controller) {
              return ListView(
                controller: controller.scrollController,
                padding: const EdgeInsets.all(10),
                children: [
                  Container(
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                          width: 1,
                          color: colorScheme.inversePrimary.withOpacity(.4),
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        androidEmailSection(
                          colorScheme,
                          userEmail: user!.email,
                        ),
                        Divider(
                          color: colorScheme.inversePrimary.withOpacity(.4),
                        ),
                        androidEditAddressDialog(
                          colorScheme,
                          title: "Phone",
                          detail: user.phone,
                          editFunction: controller.showEditPhoneNumberDialog,
                        ),
                        Divider(
                          color: colorScheme.inversePrimary.withOpacity(.4),
                        ),
                        androidEditAddressDialog(
                          colorScheme,
                          title: "Address",
                          detail: user.settings!.address,
                          editFunction: controller.showEditAddressDialog,
                        ),
                        Divider(
                          color: colorScheme.inversePrimary.withOpacity(.4),
                        ),
                        androidEditAddressDialog(
                          colorScheme,
                          title: "Username",
                          detail: user.settings!.username,
                          editFunction: controller.showEditUserNameDialog,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
