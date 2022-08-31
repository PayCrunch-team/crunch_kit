import 'package:crunch_kit/crunch_kit.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class CrunchLoadingCard extends StatelessWidget {
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;

  const CrunchLoadingCard({
    Key? key,
    this.height,
    this.width,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Shimmer.fromColors(
        baseColor: CrunchColors.almostWhite,
        highlightColor: CrunchColors.silver,
        period: const Duration(seconds: 2),
        child: Container(
          height: height ?? 20.h,
          width: width ?? 100.w - (CrunchDimensions.horizontalPadding * 2),
          decoration: BoxDecoration(
            color: CrunchColors.almostWhite,
            borderRadius: CrunchDimensions.roundBorderRadius,
          ),
        ),
      ),
    );
  }
}
