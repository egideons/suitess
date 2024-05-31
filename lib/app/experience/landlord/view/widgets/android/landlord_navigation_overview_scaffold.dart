import 'package:flutter/material.dart';

class LandLordNavigationOverViewScaffold extends StatelessWidget {
  const LandLordNavigationOverViewScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    // var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: const [],
        ),
      ),
    );
  }
}
