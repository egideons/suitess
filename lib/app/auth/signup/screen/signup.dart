import 'dart:io';

import 'package:flutter/material.dart';

import '../widgets/ios/signup_cupertino_scaffold.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return const SignupCupertinoScaffold();
    }
    return const Scaffold();
  }
}
