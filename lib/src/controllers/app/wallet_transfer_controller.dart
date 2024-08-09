import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/screens/wallet/wallet_screen/content/transactions_history_modal_sheet.dart';

class WalletTransferController extends GetxController {
  static WalletTransferController get instance {
    return Get.find<WalletTransferController>();
  }

  //================ variables =================\\
  var isRefreshing = false.obs;

  var isScrollToTopBtnVisible = false.obs;

  var hasNotifications = true.obs;
  var hideBalance = false.obs;

  //================ controllers =================\\
  var walletCardPageController = PageController();
  var scrollController = ScrollController();

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
  }

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_scrollListener);
  }

//================ Handle refresh ================\\

  Future<void> onRefresh() async {
    isRefreshing.value = true;
    update();

    await Future.delayed(const Duration(seconds: 2));

    isRefreshing.value = false;
    update();
  }

  //================ Scroll to Top =================//
  void scrollToTop() {
    scrollController.animateTo(0,
        duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
  }

  //================ Modal Bottom Sheets ================\\

  showTransactionHistoryModalSheet(BuildContext context, Size media) async {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: false,
      enableDrag: false,
      //  useSafeArea: true,

      constraints:
          BoxConstraints(maxHeight: media.height, maxWidth: media.width),
      builder: (context) {
        return GestureDetector(
          onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
          child: const TransactionsHistoryModalSheet(),
        );
      },
    );
  }

  //================ Scroll Listener =================//

  void _scrollListener() {
    //========= Show action button ========//
    if (scrollController.position.pixels >= 150) {
      isScrollToTopBtnVisible.value = true;
      update();
    }
    //========= Hide action button ========//
    else if (scrollController.position.pixels < 150) {
      isScrollToTopBtnVisible.value = false;
      update();
    }
  }
}
