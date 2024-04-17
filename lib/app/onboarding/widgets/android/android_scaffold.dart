import 'package:flutter/material.dart';
import 'package:kribb/app/onboarding/controllers/onboarding_page_controller.dart';

class AndroidOnboardingScaffold extends StatelessWidget {
  final OnboardingController controller;
  const AndroidOnboardingScaffold({
    super.key,
    required this.controller,
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
