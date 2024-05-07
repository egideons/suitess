import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../src/controllers/landlord_view_property_controller.dart';

class LandLordViewPropertyCupertinoScaffold extends StatelessWidget {
  const LandLordViewPropertyCupertinoScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    var controller = LandLordViewPropertyController.instance;

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(),
      child: ListView(
        padding: const EdgeInsets.all(10),
        children: const [],
      ),
    );
  }
}
