import 'package:flutter/material.dart';

class AndroidOnboardingScaffold extends StatelessWidget {
  const AndroidOnboardingScaffold({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Scrollbar(
          child: ListView(
            children: const [],
          ),
        ),
      ),
    );
  }
}
