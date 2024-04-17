// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:kribb/app/splash/widgets/page_content.dart';

class StartupSplashscreen extends StatelessWidget {
  const StartupSplashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    Future.delayed(const Duration(seconds: 3), () async {});

    return Scaffold(
      body: SafeArea(
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            pageContent(media),
          ],
        ),
      ),
    );
  }
}
