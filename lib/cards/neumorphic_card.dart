import 'package:crunch_kit/crunch_kit.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CrunchNeumorphicCard extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget? child;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final GestureTapCallback? onPressed;

  const CrunchNeumorphicCard({
    Key? key,
    this.height,
    this.width,
    this.child,
    this.color,
    this.padding,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed != null
          ? () async {
              await HapticFeedback.mediumImpact();
              FocusManager.instance.primaryFocus?.unfocus();
              onPressed!();
            }
          : null,
      child: SizedBox(
        height: height,
        width: width,
        child: Neumorphic(
          style: NeumorphicStyle(
            color: color ?? CrunchColors.almostWhite,
            shape:
                color == null ? NeumorphicShape.flat : NeumorphicShape.convex,
            lightSource: LightSource.top,
            boxShape: NeumorphicBoxShape.roundRect(
              CrunchDimensions.roundBorderRadius,
            ),
          ),
          child: Padding(
            padding:
                padding ?? EdgeInsets.all(CrunchDimensions.horizontalPadding),
            child: child,
          ),
        ),
      ),
    );
  }
}
