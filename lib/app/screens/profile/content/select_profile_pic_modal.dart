import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../src/controllers/app/profile_screen_controller.dart';
import '../../../../src/controllers/auth/user_controller.dart';

class SelectProfilePicModal extends GetView<ProfileScreenController> {
  const SelectProfilePicModal({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;
    var user = UserController.instance.userModel.value.data;

    return Container(
      decoration: ShapeDecoration(
        color: colorScheme.surface,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
        ),
        // shadows: [
        //   BoxShadow(
        //     color: colorScheme.inversePrimary.withOpacity(.2),
        //     offset: const Offset(4, 0),
        //     blurRadius: 10,
        //     spreadRadius: 2,
        //   ),
        // ],
      ),
    );
  }
}
