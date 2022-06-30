import 'dart:async';

import 'package:crunch_kit/crunch_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CrunchBlueGradientCard extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget? child;
  final GestureTapCallback? onTap;

  const CrunchBlueGradientCard({
    Key? key,
    this.height,
    this.width,
    this.child,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        unawaited(HapticFeedback.mediumImpact());
        onTap!();
      },
      child: Card(
        elevation: 8.0,
        shadowColor: CrunchColors.superLightBlue,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: CrunchDimensions.roundBorderRadius,
        ),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: CrunchDimensions.roundBorderRadius,
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                CrunchColors.payCrunchBlue,
                CrunchColors.lightBlue,
              ],
              tileMode: TileMode.mirror,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(CrunchDimensions.horizontalPadding),
            child: child,
          ),
        ),
      ),
    );
  }
}