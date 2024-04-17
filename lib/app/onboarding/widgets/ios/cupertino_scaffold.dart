import 'package:flutter/cupertino.dart';

import '../../../../src/constants/consts.dart';
import '../../../../theme/colors.dart';

class CupertinoOnboardingScaffold extends StatelessWidget {
  final PageController pageController;
  const CupertinoOnboardingScaffold({
    super.key,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: kTransparentColor,
        middle: Text(
          "Onboarding",
          overflow: TextOverflow.ellipsis,
          style: defaultTextStyle(fontSize: 18.0),
        ),
      ),
      child: CupertinoScrollbar(
        child: PageView(
          controller: pageController,
          children: const [],
        ),
      ),
    );
  }
}
