import 'package:flutter/material.dart';

import '../../../../../../src/controllers/landlord_view_property_controller.dart';

class LandLordViewPropertyScaffold extends StatelessWidget {
  const LandLordViewPropertyScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    var controller = LandLordViewPropertyController.instance;

    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: const [],
      ),
    );
  }
}
