import 'dart:async';

import 'package:crunch_kit/colors.dart';
import 'package:crunch_kit/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

class CrunchBackButton extends StatelessWidget {
  final Color? color;
  final VoidCallback? onPressed;

  const CrunchBackButton({
    Key? key,
    this.color,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      color: CrunchColors.superLightGrey,
      shape: RoundedRectangleBorder(
        borderRadius: CrunchDimensions.roundBorderRadius,
      ),
      child: InkWell(
        borderRadius: CrunchDimensions.roundBorderRadius,
        onTap: () {
          unawaited(HapticFeedback.mediumImpact());
          if (onPressed != null) {
            onPressed!();
          } else {
            Navigator.maybePop(context);
          }
        },
        child: Icon(
          Icons.chevron_left_rounded,
          color: CrunchColors.almostBlack,
          size: 16.sp,
        ),
      ),
    );
  }
}
