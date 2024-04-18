import 'package:flutter/material.dart';

import '../../constants/consts.dart';

class Skeleton extends StatelessWidget {
  const Skeleton({
    super.key,
    required this.height,
    required this.width,
    required this.borderRadius,
    this.color,
  });
  final double height, width, borderRadius;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).colorScheme;
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(kDefaultPadding / 2),
      decoration: BoxDecoration(
        color: color ?? theme.inversePrimary.withOpacity(0.08),
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      ),
    );
  }
}
