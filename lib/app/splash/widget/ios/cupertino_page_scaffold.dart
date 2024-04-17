import 'package:flutter/cupertino.dart';

import '../../../splash/widget/content/page_content.dart';

class IOSScaffold extends StatelessWidget {
  const IOSScaffold({
    super.key,
    required this.media,
  });

  final Size media;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
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
