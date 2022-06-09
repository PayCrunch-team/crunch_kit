import 'dart:async';

import 'package:crunch_kit/colors.dart';
import 'package:crunch_kit/dimensions.dart';
import 'package:crunch_kit/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

class CrunchPrimaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const CrunchPrimaryButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: CrunchColors.payCrunchBlue,
        fixedSize: Size(MediaQuery.of(context).size.width - 16.w, 6.h),
        shape: RoundedRectangleBorder(
          borderRadius: CrunchDimensions.roundBorderRadius,
        ),
      ),
      onPressed: () {
        unawaited(HapticFeedback.mediumImpact());
        onPressed();
      },
      child: Text(
        text,
        style: CrunchTextStyles.primaryButton,
      ),
    );
  }
}
