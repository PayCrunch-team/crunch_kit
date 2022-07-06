import 'dart:async';

import 'package:crunch_kit/crunch_kit.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

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
      onTap: onTap != null
          ? () {
              unawaited(HapticFeedback.mediumImpact());
              onTap!();
            }
          : null,
      child: SizedBox(
        height: height,
        width: width,
        child: Neumorphic(
          style: NeumorphicStyle(
            color: CrunchColors.payCrunchBlue,
            shape: NeumorphicShape.convex,
            boxShape: NeumorphicBoxShape.roundRect(
              CrunchDimensions.roundBorderRadius,
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
