import 'package:flutter/cupertino.dart';

class CupertinoOnboardingScaffold extends StatelessWidget {
  final PageController pageController;
  const CupertinoOnboardingScaffold({
    super.key,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      // navigationBar: CupertinoNavigationBar(
      //   backgroundColor:
      //       Get.isDarkMode ? kDarkBackgroundColor : kLightBackgroundColor,
      //   middle: Text(
      //     "Onboarding",
      //     overflow: TextOverflow.ellipsis,
      //     style: defaultTextStyle(fontSize: 18.0),
      //   ),
      // ),
      child: CupertinoScrollbar(
        child: PageView(
          controller: pageController,
          children: const [],
        ),
      ),
    );
  }
}
