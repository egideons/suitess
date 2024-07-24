import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/src/utils/components/my_app_bar.dart';

import '../../../../../../../src/controllers/app/contact_details_controller.dart';
import '../../content/edit_detail.dart';
import '../../content/email_section.dart';

class ContactDetailsScaffold extends GetView<ContactDetailsScreenController> {
  const ContactDetailsScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    // var controller = ProfileScreenController.instance;
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
                        emailSection(
                          colorScheme,
                          userEmail: "userexample@gmail.com",
                        ),
                        Divider(
                          color: colorScheme.inversePrimary.withOpacity(.4),
                        ),
                        editDetail(
                          colorScheme,
                          title: "Phone",
                          detail: "+234 9037703499",
                          editFunction: () {},
                        ),
                        Divider(
                          color: colorScheme.inversePrimary.withOpacity(.4),
                        ),
                        editDetail(
                          colorScheme,
                          title: "Address",
                          detail: "Independence layout, Enugu Nigeria",
                          editFunction: () {},
                        ),
                        Divider(
                          color: colorScheme.inversePrimary.withOpacity(.4),
                        ),
                        editDetail(
                          colorScheme,
                          title: "Business name / Username",
                          detail: "Omedel Limited",
                          editFunction: () {},
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
