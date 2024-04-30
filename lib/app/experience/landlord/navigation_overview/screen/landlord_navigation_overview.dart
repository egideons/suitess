import 'dart:io';

import 'package:flutter/material.dart';

import '../widgets/android/landlord_navigation_overview_scaffold.dart';
import '../widgets/ios/landlord_navigation_overview_cupertino_scaffold.dart';

class LandLordNavigationOverView extends StatelessWidget {
  const LandLordNavigationOverView({super.key});

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return const LandLordNavigationOverViewCupertinoScaffold();
    }
    return const LandLordNavigationOverViewScaffold();
  }
}
