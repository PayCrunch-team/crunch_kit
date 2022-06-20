import 'dart:async';

import 'package:crunch_kit/colors.dart';
import 'package:crunch_kit/dimensions.dart';
import 'package:crunch_kit/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shimmer/shimmer.dart';
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
        fixedSize: Size(100.w - (CrunchDimensions.horizontalPadding * 2), 6.h),
        shape: RoundedRectangleBorder(
          borderRadius: CrunchDimensions.circleBorderRadius,
        ),
      ),
      onPressed: () {
        unawaited(HapticFeedback.mediumImpact());
        onPressed();
      },
      child: Shimmer.fromColors(
        baseColor: CrunchColors.almostWhite,
        highlightColor: CrunchColors.superLightBlue,
        period: const Duration(seconds: 4),
        child: Text(
          text,
          style: CrunchTextStyles.primaryButton,
        ),
      ),
    );
  }
}
