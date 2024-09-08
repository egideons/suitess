import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../src/controllers/app/profile_screen_controller.dart';

class UploadingProfilePicModal extends GetView<ProfileScreenController> {
  const UploadingProfilePicModal({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: media.width,
      padding: const EdgeInsets.all(10),
      decoration: const ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
      ),
      child: const Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [],
      ),
    );
  }
}
