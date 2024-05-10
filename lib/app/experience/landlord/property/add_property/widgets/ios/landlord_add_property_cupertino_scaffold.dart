import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../src/controllers/landlord/landlord_add_property_controller.dart';

class LandLordViewPropertyCupertinoScaffold
    extends GetView<LandLordAddPropertyController> {
  const LandLordViewPropertyCupertinoScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    var controller = LandLordAddPropertyController.instance;

    return CupertinoPageScaffold(
      child: SafeArea(
        child: CupertinoScrollbar(
          child: ListView(),
        ),
      ),
    );
  }
}
