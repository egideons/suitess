// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AndroidNameTextFormField extends StatelessWidget {
  final String? hintText;
  final TextEditingController controller;
  final FormFieldValidator validator;
  final dynamic onSaved;
  final TextInputAction textInputAction;
  final FocusNode focusNode;
  final TextCapitalization textCapitalization;

  final Function(String)? onFieldSubmitted, onChanged;
  final Widget? label, prefix, suffix, prefixIcon, suffixIcon;
  final TextStyle? helperStyle, prefixStyle, suffixStyle;
  final String? labelText, helperText, suffixText, prefixText;
  final Color? prefixIconColor, suffixIconColor;
  final bool? enabled, readOnly, alignLabelWithHint;

  final List<TextInputFormatter>? inputFormatters;
  final void Function()? onTap;

  const AndroidNameTextFormField({
    super.key,
    required this.controller,
    required this.validator,
    this.onSaved,
    required this.textInputAction,
    required this.focusNode,
    this.hintText,
    required this.textCapitalization,
    this.onChanged,
    this.onFieldSubmitted,
    this.label,
    this.labelText,
    this.alignLabelWithHint,
    this.enabled,
    this.readOnly,
    this.inputFormatters,
    this.onTap,
    this.prefix,
    this.suffix,
    this.prefixIcon,
    this.suffixIcon,
    this.helperStyle,
    this.prefixStyle,
    this.suffixStyle,
    this.helperText,
    this.suffixText,
    this.prefixText,
    this.prefixIconColor,
    this.suffixIconColor,
  });

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return TextFormField(
      focusNode: focusNode,
      controller: controller,
      validator: validator,
      enabled: enabled,
      readOnly: readOnly ?? false,
      cursorOpacityAnimates: true,
      enableIMEPersonalizedLearning: true,
      mouseCursor: SystemMouseCursors.text,
      onTap: onTap,
      inputFormatters: inputFormatters,
      onFieldSubmitted: onFieldSubmitted,
      onSaved: onSaved,
      onChanged: onChanged,
      textInputAction: textInputAction,
      textAlign: TextAlign.start,
      cursorColor: colorScheme.inversePrimary,
      autocorrect: true,
      enableSuggestions: true,
      keyboardType: TextInputType.name,
      textCapitalization: textCapitalization,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      maxLines: 1,
      style: TextStyle(
        fontSize: 16,
        color: colorScheme.secondary,
        fontWeight: FontWeight.w900,
        letterSpacing: -0.40,
      ),
      decoration: InputDecoration(
        helperText: helperText,
        helperStyle: helperStyle,
        prefix: prefix,
        prefixIcon: prefixIcon,
        prefixText: prefixText,
        prefixStyle: prefixStyle,
        prefixIconColor: prefixIconColor,
        suffix: suffix,
        suffixIcon: suffixIcon,
        suffixIconColor: suffixIconColor,
        suffixText: suffixText,
        suffixStyle: suffixStyle,
        hintText: hintText,
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
