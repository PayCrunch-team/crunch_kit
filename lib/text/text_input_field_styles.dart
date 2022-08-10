import 'package:crunch_kit/text/text_field_styles.dart';
import 'package:crunch_kit/text/text_styles.dart';
import 'package:crunch_kit/utils/colors.dart';
import 'package:crunch_kit/utils/dimensions.dart';
import 'package:flutter/material.dart';

class CrunchInputField extends StatelessWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String hintText;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType textInputType;
  final FocusNode? focusNode;

  const CrunchInputField({
    Key? key,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
    this.textInputType = TextInputType.emailAddress,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        color: CrunchColors.superLightGrey,
        borderRadius: CrunchDimensions.roundBorderRadius,
      ),
      child: TextFormField(
        autocorrect: false,
        enableSuggestions: false,
        decoration: InputDecoration(
          enabledBorder: CrunchTextFieldStyles.enabledBorder,
          focusedBorder: CrunchTextFieldStyles.focusedBorder,
          prefixIcon: prefixIcon,
          hintText: hintText,
          hintStyle: CrunchTextStyles.subTitleGrey,
          suffixIcon: suffixIcon,
        ),
        validator: validator,
        controller: controller,
        obscureText: obscureText,
        focusNode: focusNode,
      ),
    );
  }
}
