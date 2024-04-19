// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AndroidMessageTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final FormFieldValidator validator;
  final TextInputAction textInputAction;
  final FocusNode focusNode;
  final Function(String)? onFieldSubmitted, onChanged;
  final Function(String?)? onSaved;
  final Widget? label, prefix, suffix, prefixIcon, suffixIcon;
  final TextStyle? helperStyle, prefixStyle, suffixStyle;
  final String? labelText, helperText, suffixText, prefixText;
  final Color? prefixIconColor, suffixIconColor;
  final bool? enabled, readOnly, alignLabelWithHint;

  final int? maxLength, maxLines;
  final List<TextInputFormatter>? inputFormatters;
  final void Function()? onTap;

  const AndroidMessageTextFormField({
    super.key,
    required this.controller,
    required this.validator,
    this.onSaved,
    required this.textInputAction,
    required this.focusNode,
    required this.hintText,
    this.onChanged,
    this.onFieldSubmitted,
    this.label,
    this.labelText,
    this.alignLabelWithHint,
    this.enabled,
    this.readOnly,
    this.inputFormatters,
    this.onTap,
    this.maxLength,
    this.maxLines,
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
      keyboardType: TextInputType.multiline,
      textCapitalization: TextCapitalization.sentences,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      maxLines: maxLines ?? 10,
      maxLength: maxLength,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      style: TextStyle(
        color: colorScheme.inversePrimary,
        fontWeight: FontWeight.w900,
        letterSpacing: -0.40,
        fontSize: 16,
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
          color: colorScheme.primary,
          fontWeight: FontWeight.w900,
          letterSpacing: -0.40,
        ),
        hintStyle: TextStyle(
          fontSize: 16,
          color: colorScheme.primary,
          fontWeight: FontWeight.w900,
          letterSpacing: -0.40,
        ),
        // errorStyle: const TextStyle(color: Colors.red),
        border: InputBorder.none,
        // enabledBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(10.0),
        //   borderSide: BorderSide(
        //     color: colorScheme.primary,
        //   ),
        // ),
        // focusedBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(10.0),
        //   borderSide: BorderSide(
        //     color: colorScheme.primary,
        //   ),
        // ),
      ),
    );
  }
}
