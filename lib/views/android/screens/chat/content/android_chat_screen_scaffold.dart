import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:suitess/utils/components/my_app_bar.dart';

import '../../../../../constants/assets.dart';
import '../../../../../constants/consts.dart';
import '../../../../../controllers/app/chat_controller.dart';
import '../../../../../theme/colors.dart';
import '../../../../../utils/components/circle_avatar_image.dart';
import 'android_chat_bubble.dart';
import 'android_chat_text_field.dart';

class AndroidChatScreenScaffold extends GetView<ChatController> {
  final String? userName;
  const AndroidChatScreenScaffold({this.userName, super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    var colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: myAppBar(
        colorScheme,
        media,
        centerTitle: false,
        leadingWidth: 88,
        leading: Row(
          children: [
            IconButton(
              onPressed: () {
                Get.back();
              },
              tooltip: "Go back",
              icon: Icon(
                Icons.chevron_left,
                size: 26,
                color: kAppBarIconColor,
              ),
            ),
            circleAvatarImage(colorScheme, height: 40),
          ],
        ),
        titleWidget: Text(
          userName ?? "userName",
          textAlign: TextAlign.start,
          style: defaultTextStyle(
            color: kTextBoldHeadingColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
            tooltip: "Phone call",
            onPressed: () {},
            icon: SvgPicture.asset(
              height: 18,
              Assets.phoneOutlineSvg,
              color: colorScheme.inversePrimary.withOpacity(.6),
            ),
          ),
        ],
      ),
      floatingActionButton: Obx(
        () => controller.isScrollToBottomBtnVisible.value
            ? FloatingActionButton.small(
                onPressed: controller.jumpTopBottom,
                backgroundColor: colorScheme.secondary,
                foregroundColor: kWhiteBackgroundColor,
                child: const Icon(Icons.keyboard_arrow_down),
              )
            : const SizedBox(),
      ),
      body: SafeArea(
        child: Scrollbar(
          controller: controller.scrollController,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: CustomScrollView(
              controller: controller.scrollController,
              slivers: <Widget>[
                SliverList.separated(
                  itemCount: controller.messages.length,
                  separatorBuilder: (context, index) => kSizedBox,
                  itemBuilder: (context, index) {
                    return Obx(
                      () {
                        return androidChatBubble(
                          media,
                          onTap: controller.showTimeStamp,
                          isSender: controller.messages[index].isSender,
                          message: controller.messages[index].message,
                          showTime: controller.showTime.value,
                        );
                      },
                    );
                  },
                ),
                const SliverPadding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: androidChatTextField(colorScheme, media, controller),
    );
  }
}
