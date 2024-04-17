import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text("Onboarding"),
        ),
        child: CupertinoScrollbar(
          child: ListView(
            children: const [],
          ),
        ),
      );
    }
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
