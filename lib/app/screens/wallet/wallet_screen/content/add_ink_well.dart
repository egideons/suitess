import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

addInkWell(ColorScheme colorScheme, void Function()? addFunc) {
  return InkWell(
    onTap: addFunc ?? () {},
    borderRadius: BorderRadius.circular(12),
    child: DottedBorder(
      borderType: BorderType.RRect,
      radius: const Radius.circular(12),
      padding: const EdgeInsets.all(10),
      dashPattern: const [4, 4],
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          height: 140,
          width: 20,
          child: Center(
            child: Icon(
              Icons.add_circle,
              color: colorScheme.inversePrimary,
            ),
          ),
        ),
      ),
    ),
  );
}
