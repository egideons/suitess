// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AndroidOTPTextFormField extends StatelessWidget {
  final TextInputAction textInputAction;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final Function(String)? onChanged, onFieldSubmitted;
  final TextEditingController? controller;
  final Widget? label;
  final String? labelText;
  final bool? alignLabelWithHint;
  const AndroidOTPTextFormField({
    super.key,
    required this.textInputAction,
    required this.onSaved,
    required this.validator,
    this.onChanged,
    this.controller,
    this.label,
    this.labelText,
    this.alignLabelWithHint,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      textInputAction: textInputAction,
      onFieldSubmitted: onFieldSubmitted,
      onSaved: onSaved,
      inputFormatters: [
        LengthLimitingTextInputFormatter(1),
        FilteringTextInputFormatter.digitsOnly,
      ],
      onChanged: onChanged,
      validator: validator,
      cursorColor: colorScheme.inversePrimary,
      style: TextStyle(
        fontSize: 16,
        color: colorScheme.secondary,
        fontWeight: FontWeight.w900,
        letterSpacing: -0.40,
      ),
      decoration: InputDecoration(
        hintText: "0",
        label: label,
        alignLabelWithHint: alignLabelWithHint,
        labelText: labelText,
        filled: true,
        fillColor: colorScheme.background,

        focusColor: const Color(0xFFF6F6F7),
        labelStyle: TextStyle(
          fontSize: 16,
          color: colorScheme.secondary,
          fontWeight: FontWeight.w900,
          letterSpacing: -0.40,
        ),
        hintStyle: TextStyle(
          fontSize: 16,
          color: colorScheme.secondary,
          fontWeight: FontWeight.w900,
          letterSpacing: -0.40,
        ),
        // errorStyle: const TextStyle(color: Colors.red),
        border: InputBorder.none,
        // enabledBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(10.0),
        //   borderSide: BorderSide(
        //     color: colorScheme.secondary,
        //   ),
        // ),
        // focusedBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(10.0),
        //   borderSide: BorderSide(
        //     color: colorScheme.secondary,
        //   ),
        // ),
      ),
    );
  }
}
