import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kribb/src/constants/consts.dart';
import 'package:kribb/theme/colors.dart';

class MyCupertinoTextField extends StatelessWidget {
  final String? placeholder;
  final TextEditingController controller;
  final FormFieldValidator validator;
  final dynamic onSaved;
  final TextInputAction textInputAction;
  final FocusNode focusNode;
  final TextCapitalization textCapitalization;
  final TextInputType keyboardType;

  final Function(String)? onSubmitted, onChanged;
  final Widget? prefix, suffix;
  final OverlayVisibilityMode? prefixMode, suffixMode, clearButtonMode;
  final bool? enabled, readOnly, obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final void Function()? onTap, onEditingComplete;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final String? obscuringCharacter;

  final Color? borderColor;

  const MyCupertinoTextField({
    super.key,
    required this.controller,
    required this.validator,
    this.onSaved,
    required this.textInputAction,
    required this.focusNode,
    this.placeholder,
    required this.textCapitalization,
    this.onChanged,
    this.onSubmitted,
    this.enabled,
    this.readOnly,
    this.inputFormatters,
    this.onTap,
    this.prefix,
    required this.keyboardType,
    this.maxLengthEnforcement,
    this.obscureText,
    this.obscuringCharacter,
    this.suffix,
    this.prefixMode,
    this.suffixMode,
    this.clearButtonMode,
    this.onEditingComplete,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return CupertinoTextField(
      onTap: onTap,
      focusNode: focusNode,
      controller: controller,
      maxLengthEnforcement: maxLengthEnforcement,
      obscureText: obscureText ?? false,
      obscuringCharacter: obscuringCharacter ?? "•",
      onSubmitted: onSubmitted,
      suffix: suffix,
      suffixMode: suffixMode ?? OverlayVisibilityMode.editing,
      prefixMode: prefixMode ?? OverlayVisibilityMode.editing,
      clearButtonMode: clearButtonMode ?? OverlayVisibilityMode.editing,
      onEditingComplete: onEditingComplete,
      enabled: enabled ?? true,
      readOnly: readOnly ?? false,
      inputFormatters: inputFormatters,
      onChanged: onChanged,
      textInputAction: textInputAction,
      textAlign: TextAlign.start,
      cursorColor: colorScheme.inversePrimary,
      autocorrect: true,
      enableSuggestions: true,
      minLines: 1,
      maxLength: 30,
      placeholder: placeholder,
      scrollPhysics: const BouncingScrollPhysics(),
      keyboardType: keyboardType,
      textCapitalization: textCapitalization,
      maxLines: 1,
      keyboardAppearance: Get.isDarkMode ? Brightness.dark : Brightness.light,
      prefix: prefix,
      placeholderStyle: defaultTextStyle(
        fontSize: 16.0,
        color: colorScheme.inversePrimary,
        fontWeight: FontWeight.w600,
      ),
      style: defaultTextStyle(
        fontSize: 16.0,
        color: colorScheme.primary,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        color: kTransparentColor,
        border: Border.all(color: borderColor ?? colorScheme.inversePrimary),
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
