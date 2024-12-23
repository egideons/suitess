import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/utils/components/my_app_bar.dart';

import '../../../../../../../controllers/app/account_type_controller.dart';
import 'android_account_type_field.dart';

class AndroidAccountTypeScaffold extends GetView<AccountTypeController> {
  const AndroidAccountTypeScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    var colorScheme = Theme.of(context).colorScheme;

    // var controller = AccountTypeController.instance;
    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: myAppBar(colorScheme, media, title: "Account Type"),
      body: SafeArea(
        child: Scrollbar(
          controller: controller.scrollController,
          child: GetBuilder<AccountTypeController>(
            init: AccountTypeController(),
            builder: (controller) {
              return ListView(
                controller: controller.scrollController,
                padding: const EdgeInsets.all(10),
                physics: const BouncingScrollPhysics(),
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                          width: 1,
                          color: colorScheme.inversePrimary.withOpacity(.4),
                        ),
                      ),
                    ),
                    child: androidAccountTypeField(
                      colorScheme,
                      changeAccountTypeFunc: () {},
                      changeAccountType: "Go Pro",
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
