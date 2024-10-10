import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:suitess/utils/components/my_app_bar.dart';
import 'package:suitess/views/android/screens/messages/content/android_chat_section.dart';

import '../../../../../constants/assets.dart';
import '../../../../../constants/consts.dart';
import '../../../../../controllers/app/messages_controller.dart';
import '../../../../../theme/colors.dart';

class MessagesScreenScaffold extends GetView<MessagesController> {
  const MessagesScreenScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: myAppBar(
        colorScheme,
        media,
        leadingIsVisible: false,
        automaticallyImplyLeading: false,
        leadingWidth: 0,
        centerTitle: false,
        titleWidget: Text(
          "Messages",
          textAlign: TextAlign.start,
          style: defaultTextStyle(
            color: kTextBoldHeadingColor,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(Assets.searchOutlineSvg),
          ),
        ],
      ),
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: CustomScrollView(
              controller: controller.scrollController,
              slivers: <Widget>[
                SliverList.separated(
                  itemCount: 20,
                  separatorBuilder: (context, index) => kHalfSizedBox,
                  itemBuilder: (context, index) {
                    return androidChatSection(
                      colorScheme,
                      userName: controller.userName,
                      message: controller.lastMsg,
                      numOfUnreadMsgs: 2,
                      onTap: controller.goToChat,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
