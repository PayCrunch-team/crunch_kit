import 'dart:async';

import 'package:crunch_kit/crunch_kit.dart';
import 'package:crunch_kit/text/shimmer_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

class CrunchPrimaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;

  const CrunchPrimaryButton({
    Key? key,
    this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: CrunchColors.payCrunchBlue,
        fixedSize: Size(100.w - (CrunchDimensions.horizontalPadding * 2), 6.h),
        shape: RoundedRectangleBorder(
          borderRadius: CrunchDimensions.circleBorderRadius,
        ),
      ),
      onPressed: onPressed != null
          ? () {
              unawaited(HapticFeedback.mediumImpact());
              onPressed!();
            }
          : null,
      child: onPressed != null
          ? CrunchShimmerText(
              child: CrunchText(
                text,
                style: CrunchTextStyles.primaryButton,
              ),
            )
          : CrunchText(
              text,
              style: CrunchTextStyles.primaryButton,
            ),
    );
  }
}
