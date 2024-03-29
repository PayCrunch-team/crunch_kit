import 'package:crunch_kit/crunch_kit.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class CrunchLoadingCard extends StatelessWidget {
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final bool isDark;
  final bool isBlue;

  const CrunchLoadingCard({
    Key? key,
    this.height,
    this.width,
    this.padding,
    this.isDark = false,
    this.isBlue = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Shimmer.fromColors(
        baseColor: isBlue
            ? CrunchColors.almostWhite.withOpacity(0.15)
            : isDark
                ? CrunchColors.almostBlack
                : CrunchColors.almostWhite,
        highlightColor: isBlue
            ? CrunchColors.almostWhite.withOpacity(0.5)
            : isDark
                ? CrunchColors.superDarkGrey
                : CrunchColors.silver,
        period: const Duration(seconds: 2),
        child: Container(
          height: height ?? 20.h,
          width: width ?? 100.w - (CrunchDimensions.horizontalPadding * 2),
          decoration: BoxDecoration(
            color: isDark ? CrunchColors.almostBlack : CrunchColors.almostWhite,
            borderRadius: CrunchDimensions.roundBorderRadius,
          ),
        ),
      ),
    );
  }
}
