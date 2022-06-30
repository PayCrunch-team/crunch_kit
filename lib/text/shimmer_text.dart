import 'package:crunch_kit/crunch_kit.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CrunchShimmerText extends StatelessWidget {
  final Widget child;
  final Color? baseColor;

  const CrunchShimmerText({
    Key? key,
    required this.child,
    this.baseColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? CrunchColors.almostWhite,
      highlightColor: CrunchColors.superLightBlue,
      period: const Duration(seconds: 4),
      child: child,
    );
  }
}
