import 'package:crunch_kit/crunch_kit.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class CrunchLoadingCard extends StatelessWidget {
  final double height;
  final double? width;

  const CrunchLoadingCard({
    Key? key,
    required this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: CrunchColors.superLightWhite,
      highlightColor: CrunchColors.silver,
      period: const Duration(seconds: 2),
      child: Container(
        height: height,
        width: width ?? 100.w - (CrunchDimensions.horizontalPadding * 2),
        decoration: BoxDecoration(
          color: CrunchColors.superLightWhite,
          borderRadius: CrunchDimensions.roundBorderRadius,
        ),
      ),
    );
  }
}
