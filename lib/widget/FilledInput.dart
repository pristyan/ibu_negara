import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ibu_negara/resource/style/TextStyle.dart';
import 'package:ibu_negara/resource/value/Colors.dart';
import 'package:ibu_negara/resource/value/Dimension.dart';

class FilledInputText extends StatelessWidget {
  final String hint;
  final int maxLength;
  final int minLines;
  final int maxLines;
  final TextEditingController controller;
  final TextCapitalization capitalization;
  final String counterText;
  final TextInputType textInputType;
  final bool enabled;
  final bool obscureText;
  final Widget rightIcon;

  final Function(String) onChange;
  final List<TextInputFormatter> inputFormatter;

  FilledInputText({
    this.hint,
    this.minLines,
    this.maxLines,
    this.controller,
    this.capitalization,
    this.maxLength,
    this.counterText = "",
    this.textInputType,
    this.enabled = true,
    this.obscureText = false,
    this.rightIcon,
    this.onChange,
    this.inputFormatter,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.all(Radius.circular(spacing_normal)),
      ),
      child: TextField(
        enabled: enabled,
        style: input_text_style,
        textCapitalization: capitalization ?? TextCapitalization.sentences,
        inputFormatters: inputFormatter,
        minLines: minLines ?? 1,
        maxLines: maxLines ?? minLines ?? 1,
        controller: controller,
        onChanged: onChange,
        obscureText: obscureText,
        keyboardType: textInputType ?? TextInputType.text,
        maxLength: maxLength ?? 1000,
        decoration: InputDecoration(
          hintText: hint,
          counterText: counterText,
          contentPadding: EdgeInsets.symmetric(
            vertical: spacing_medium,
            horizontal: spacing_medium,
          ),
          suffixIcon: rightIcon,
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: color_primary,
              width: 1.5,
            ),
            borderRadius: BorderRadius.all(Radius.circular(spacing_normal)),
          ),
          errorBorder: InputBorder.none,
        ),
      ),
    );
  }
}
