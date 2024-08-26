import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/screens/wallet/wallet_screen/content/transactions_history_modal_sheet.dart';
import '../../../main.dart';
import '../../models/wallet/transaction_filter_section_model.dart';
import '../../routes/routes.dart';

class WalletScreenController extends GetxController {
  static WalletScreenController get instance {
    return Get.find<WalletScreenController>();
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
  }

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_scrollListener);
    loadVisibilityState();
  }

  //================ variables =================\\
  var isRefreshing = false.obs;
  var isScrollToTopBtnVisible = false.obs;
  var hasNotifications = true.obs;
  var hideBalance = false.obs;
  var transactionHistoryFilterIsVisible = false.obs;
  var filterTabs = [
    TransactionFilterSectionModel(name: "Categories", isSelected: true),
    TransactionFilterSectionModel(name: "Month", isSelected: false),
  ].obs;

  //================ controllers =================\\
  var transactionHistoryFilterPageController = PageController();
  var scrollController = ScrollController();

  //================ Wallet functions ================\\
  changeVisibilityState() {
    saveVisibilityState(!hideBalance.value);
    hideBalance.value = !hideBalance.value;
    update();
  }

  //================ Navigation ================\\

  goToAirtime() async {}

  goToElectricity() async {}

  goToTransferOptions() async {
    Get.toNamed(
      Routes.transferOptions,
      preventDuplicates: true,
    );
    //     await Get.to(
    //   () => const TransferOptions(),
    //   routeName: "/transfer-options",
    //   fullscreenDialog: true,
    //   curve: Curves.easeInOut,
    //   preventDuplicates: true,
    //   popGesture: false,
    //   transition: Get.defaultTransition,
    // );
  }

  gotToData() async {}

  //=========================== Save card state ============================//
  // Load visibility state from SharedPreferences
  Future<void> loadVisibilityState() async {
    hideBalance.value = prefs.getBool('hideBalance') ?? hideBalance.value;
    update();
  }

//================ Handle refresh ================\\

  Future<void> onRefresh() async {
    isRefreshing.value = true;
    update();

    await Future.delayed(const Duration(seconds: 2));

    isRefreshing.value = false;
    update();
  }

  // Save visibility state to SharedPreferences
  Future<void> saveVisibilityState(bool value) async {
    await prefs.setBool('hideBalance', value);
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

  toggleTransactionHistoryFilter() {
    transactionHistoryFilterIsVisible.value =
        !transactionHistoryFilterIsVisible.value;
  }

//================ Select Filter Tab =================//
  void selectFilterTab(int index) {
    for (int i = 0; i < filterTabs.length; i++) {
      filterTabs[i].isSelected = i == index;
    }
    update();
  }

  goToMonthPage() {
    transactionHistoryFilterPageController.animateToPage(
      1,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  goToCategoriesPage() {
    transactionHistoryFilterPageController.animateToPage(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
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
