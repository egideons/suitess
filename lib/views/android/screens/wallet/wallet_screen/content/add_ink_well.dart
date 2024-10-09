import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

addInkWell(ColorScheme colorScheme, void Function()? addFunc) {
  return InkWell(
    onTap: addFunc ?? () {},
    borderRadius: BorderRadius.circular(6),
    child: DottedBorder(
      borderType: BorderType.RRect,
      radius: const Radius.circular(6),
      padding: const EdgeInsets.all(6),
      dashPattern: const [8, 8],
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          height: 140,
          width: 12,
          child: Center(
            child: Icon(
              Icons.add_circle,
              color: colorScheme.inversePrimary,
              size: 12,
            ),
          ),
        ),
      ),
    ),
  );
}
