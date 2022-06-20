import 'package:crunch_kit/colors.dart';
import 'package:flutter/material.dart';

class CrunchTextFieldStyles {
  static final enabledBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: const BorderSide(
      color: CrunchColors.superLightGrey,
      width: 2,
    ),
  );

  static final focusedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: const BorderSide(
      color: CrunchColors.payCrunchBlue,
      width: 2,
    ),
  );
}
