import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kribb/src/controllers/kyc_choose_location_controller.dart';

import '../../../../../src/constants/consts.dart';
import '../../content/kyc_choose_location_page_header.dart';

class KycChooseLocationCupertinoScaffold
    extends GetView<KycChooseLocationController> {
  const KycChooseLocationCupertinoScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    final kycChooseLocationController = KycChooseLocationController.instance;
    return CupertinoPageScaffold(
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            kycChooseLocationPageHeader(colorScheme: colorScheme, media: media),
            const SizedBox(height: kDefaultPadding * 2),
            Form(
              key: kycChooseLocationController.formKey,
              child: const Column(
                children: [],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
