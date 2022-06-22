import 'package:crunch_kit/crunch_kit.dart';
import 'package:flutter/material.dart';

class CrunchWhiteCard extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget? child;

  const CrunchWhiteCard({
    Key? key,
    this.height,
    this.width,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      color: CrunchColors.superLightWhite,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: CrunchDimensions.roundBorderRadius,
      ),
      child: SizedBox(
        height: height,
        width: width,
        child: Padding(
          padding: EdgeInsets.all(CrunchDimensions.horizontalPadding),
          child: child,
        ),
      ),
    );
  }
}
