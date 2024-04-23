import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kribb/src/controllers/kyc_profile_photo_controller.dart';

class KycProfilePhotoCupertinoScaffold
    extends GetView<KycProfilePhotoController> {
  const KycProfilePhotoCupertinoScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    var kycProfilePhotoController = KycProfilePhotoController.instance;

    return CupertinoPageScaffold(
      child: ListView(
        padding: const EdgeInsets.all(10),
        children: [],
      ),
    );
  }
}
