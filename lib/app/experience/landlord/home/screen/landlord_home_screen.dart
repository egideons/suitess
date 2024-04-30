import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kribb/app/experience/landlord/home/widgets/android/landlord_dashboard_scaffold.dart';
import 'package:kribb/app/experience/landlord/home/widgets/ios/landlord_dashboard_cupertino_scaffold.dart';

class LandLordHomeScreen extends StatelessWidget {
  const LandLordHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return const LandLordHomeScreenCupertinoScaffold();
    }
    return const LandLordHomeScreenScaffold();
  }
}
