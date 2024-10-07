import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../src/controllers/app/bottom_navigation_controller.dart';

class BottomNavigationViewCupertinoScaffold
    extends GetView<BottomNavigationController> {
  final int? currentIndex;
  const BottomNavigationViewCupertinoScaffold({super.key, this.currentIndex});

  @override
  Widget build(BuildContext context) {
    // var colorScheme = Theme.of(context).colorScheme;

    // var controller = BottomNavigationController.instance;

    return CupertinoPageScaffold(
      child: SafeArea(child: ListView()),
    );
  }
}
