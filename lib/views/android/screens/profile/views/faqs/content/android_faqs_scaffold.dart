import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../controllers/app/faqs_controller.dart';
import '../../../../../../../theme/colors.dart';
import '../../../../../../../utils/components/my_app_bar.dart';
import 'android_expansion_tile.dart';

class AndroidFaqsScaffold extends GetView<FaqsController> {
  const AndroidFaqsScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: myAppBar(colorScheme, media, title: "FAQs"),
      floatingActionButton: Obx(
        () => controller.isScrollToTopBtnVisible.value
            ? FloatingActionButton.small(
                onPressed: controller.scrollToTop,
                backgroundColor: colorScheme.secondary,
                foregroundColor: kWhiteBackgroundColor,
                child: const Icon(Icons.keyboard_arrow_up),
              )
            : const SizedBox(),
      ),
      body: SafeArea(
        child: Scrollbar(
          controller: controller.scrollController,
          child: GetBuilder<FaqsController>(
            init: FaqsController(),
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
                      children: [
                        androidFaqsExpansionTile(
                          colorScheme,
                          title: "Profile Visibility",
                          content:
                              "Laboris ad velit culpa et tempor. Quis aliquip irure nulla tempor consectetur. Proident laborum voluptate quis adipisicing velit non aliquip dolore officia.\nEsse fugiat fugiat aliqua quis minim velit proident laborum. Labore adipisicing dolore occaecat incididunt enim amet sunt anim ipsum cillum. Aute veniam qui sunt nisi commodo adipisicing ea eiusmod est do irure. Cillum qui quis mollit do dolor labore dolor cillum. Aute incididunt adipisicing eiusmod nostrud cillum consequat nostrud cupidatat commodo. Officia amet minim nostrud nostrud aliquip laborum aute proident labore mollit.",
                        ),
                        Divider(
                          color: colorScheme.inversePrimary.withOpacity(.4),
                          height: 0,
                        ),
                        androidFaqsExpansionTile(
                          colorScheme,
                          title: "Listed Properties",
                          content:
                              "Incididunt consectetur magna incididunt ut. Adipisicing elit occaecat labore non voluptate reprehenderit mollit laborum exercitation. Aliqua in consectetur ad exercitation ad proident. Enim labore ipsum consequat deserunt fugiat nulla ut et. Consectetur nisi aliquip sint laborum laborum culpa aliqua reprehenderit aute tempor sit velit in. Voluptate ipsum in irure fugiat sint ullamco duis nostrud officia ipsum cillum laborum. Labore duis mollit non proident aute.\nCulpa ut magna magna voluptate cupidatat labore dolor ad ea non. Cupidatat dolor eu laborum quis labore ipsum amet deserunt amet pariatur eu eiusmod pariatur velit. Eiusmod enim nostrud deserunt laborum reprehenderit esse ullamco occaecat sunt. Et aliqua officia qui anim laborum amet aliquip cupidatat non magna laborum ex. Pariatur magna consectetur anim irure elit eiusmod reprehenderit labore amet velit.\nDolor labore eu officia duis officia fugiat labore sint. Commodo sunt velit ut veniam consectetur labore aliqua Lorem ipsum mollit exercitation. Ipsum proident irure anim Lorem magna enim. Velit voluptate anim aliquip occaecat culpa ad laborum et tempor consectetur. Deserunt ut dolore qui est Lorem ut ipsum commodo fugiat aliquip qui.\nDo consectetur esse veniam eu. Sunt sit eu anim irure non nisi proident. Laboris nostrud pariatur nostrud est Lorem sunt duis irure proident mollit et aute ullamco.",
                        ),
                        androidFaqsExpansionTile(
                          colorScheme,
                          title: "Activity Status",
                          content:
                              "Incididunt consectetur magna incididunt ut. Adipisicing elit occaecat labore non voluptate reprehenderit mollit laborum exercitation. Aliqua in consectetur ad exercitation ad proident. Enim labore ipsum consequat deserunt fugiat nulla ut et. Consectetur nisi aliquip sint laborum laborum culpa aliqua reprehenderit aute tempor sit velit in. Voluptate ipsum in irure fugiat sint ullamco duis nostrud officia ipsum cillum laborum. Labore duis mollit non proident aute.\nCulpa ut magna magna voluptate cupidatat labore dolor ad ea non. Cupidatat dolor eu laborum quis labore ipsum amet deserunt amet pariatur eu eiusmod pariatur velit. Eiusmod enim nostrud deserunt laborum reprehenderit esse ullamco occaecat sunt. Et aliqua officia qui anim laborum amet aliquip cupidatat non magna laborum ex. Pariatur magna consectetur anim irure elit eiusmod reprehenderit labore amet velit.\nDolor labore eu officia duis officia fugiat labore sint. Commodo sunt velit ut veniam consectetur labore aliqua Lorem ipsum mollit exercitation. Ipsum proident irure anim Lorem magna enim. Velit voluptate anim aliquip occaecat culpa ad laborum et tempor consectetur. Deserunt ut dolore qui est Lorem ut ipsum commodo fugiat aliquip qui.\nDo consectetur esse veniam eu. Sunt sit eu anim irure non nisi proident. Laboris nostrud pariatur nostrud est Lorem sunt duis irure proident mollit et aute ullamco.",
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
