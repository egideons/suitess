import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kribb/theme/colors.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Container(
            decoration: BoxDecoration(
              color: kSuccessColor.withOpacity(0.4),
            ),
          ),
        ),
        child: ListView(
          children: const [],
        ),
      );
    }
    return const Scaffold();
  }
}
