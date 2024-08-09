import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/src/utils/components/my_app_bar.dart';

import '../../../../../src/controllers/app/wallet_transfer_controller.dart';

class WalletTransferTxDetails extends GetView<WalletTransferController> {
  const WalletTransferTxDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: myAppBar(
        colorScheme,
        media,
        leadingIsVisible: false,
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: "Transaction Details",
        actions: [
          IconButton(
            onPressed: () {
              Get.close(0);
            },
            icon: Icon(
              Icons.close,
              color: colorScheme.inversePrimary,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: RefreshIndicator.adaptive(
          onRefresh: controller.onRefresh,
          backgroundColor: colorScheme.surface,
          color: colorScheme.primary,
          child: Scrollbar(
            controller: controller.scrollController,
            child: GetBuilder<WalletTransferController>(
              init: WalletTransferController(),
              builder: (controller) {
                return const SingleChildScrollView();
              },
            ),
          ),
        ),
      ),
    );
  }
}
