import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../models/chat/chat_message_model.dart';

class ChatController extends GetxController {
  static ChatController get instance {
    return Get.find<ChatController>();
  }

  @override
  void onInit() {
    super.onInit();
    // Scroll to bottom when the controller is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      jumpTopBottom();
    });
    scrollController.addListener(_scrollListener);
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
  }

  //================ variables =================\\
  var isRefreshing = false.obs;
  var showTime = false.obs;
  var isScrollToBottomBtnVisible = false.obs;
  var canSubmit = false.obs;

  //================ Controllers =================\\
  var scrollController = ScrollController();
  var chatEC = TextEditingController();

  //================ Focus Nodes =================\\
  var chatFN = FocusNode();

//================ Scroll to Top =================//
  void jumpTopBottom() {
    if (scrollController.hasClients) {
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    }
    isScrollToBottomBtnVisible.value = false;
  }

//================ Scroll Listener =================//

  void _scrollListener() {
    if (scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      isScrollToBottomBtnVisible.value = true;
    } else if (scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      isScrollToBottomBtnVisible.value = false;
    }
  }

//================ Handle refresh ================\\

  Future<void> onRefresh() async {
    isRefreshing.value = true;
    update();

    await Future.delayed(const Duration(seconds: 2));

    isRefreshing.value = false;
    update();
  }

  //================ Chat UI =================//
  List<ChatMessageModel> messages = <ChatMessageModel>[
    ChatMessageModel(
      isSender: false,
      message:
          "Hi, thanks for meeting with me today! How can I assist you in your home search?",
      timestamp: DateTime.now(),
    ),
    ChatMessageModel(
      isSender: true,
      message:
          "Hi! Thanks for your time. I'm looking for a 3-bedroom house in a family-friendly neighborhood.",
      timestamp: DateTime.now(),
    ),
    ChatMessageModel(
      isSender: false,
      message:
          "Absolutely, I have a few properties in mind. Do you have any specific preferences, like the type of house, proximity to schools, or any must-have features?",
      timestamp: DateTime.now(),
    ),
    ChatMessageModel(
      isSender: true,
      message:
          "I'd prefer a single-family home with a backyard, and it would be great if it’s within walking distance to good schools. A modern kitchen and a two-car garage are also on my wish list.",
      timestamp: DateTime.now(),
    ),
    ChatMessageModel(
      isSender: false,
      message:
          "Hi, thanks for meeting with me today! How can I assist you in your home search?",
      timestamp: DateTime.now(),
    ),
    ChatMessageModel(
      isSender: true,
      message:
          "Hi! Thanks for your time. I'm looking for a 3-bedroom house in a family-friendly neighborhood.",
      timestamp: DateTime.now(),
    ),
    ChatMessageModel(
      isSender: false,
      message:
          "Absolutely, I have a few properties in mind. Do you have any specific preferences, like the type of house, proximity to schools, or any must-have features?",
      timestamp: DateTime.now(),
    ),
    ChatMessageModel(
      isSender: true,
      message:
          "I'd prefer a single-family home with a backyard, and it would be great if it’s within walking distance to good schools. A modern kitchen and a two-car garage are also on my wish list.",
      timestamp: DateTime.now(),
    ),
  ];

  showTimeStamp() async {
    showTime.value = !showTime.value;
    update();
  }

  chatTextFieldOnChanged(value) {
    // Check if the text field is empty
    if (value.isEmpty) {
      canSubmit.value = false;
    } else {
      canSubmit.value = true;
    }
    update();
  }

  chatTextFieldOnSubmitted(value) {
    if (canSubmit.isTrue) {
      sendText();
    }
    update();
  }

  Future<void> sendText() async {
    chatEC.clear();
    canSubmit.value = false;
    update();
  }

  //================ Navigation =================//
  makeCall() {}
}
