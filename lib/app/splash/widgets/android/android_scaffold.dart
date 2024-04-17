import 'package:flutter/material.dart';

import '../page_content.dart';

class AndroidScaffold extends StatelessWidget {
  const AndroidScaffold({
    super.key,
    required this.media,
  });

  final Size media;

  @override
  Widget build(BuildContext context) {
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
