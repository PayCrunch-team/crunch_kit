import 'package:crunch_kit/crunch_kit.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:sizer/sizer.dart';

class CrunchPrimaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? highlightColor;
  final bool isDark;

  const CrunchPrimaryButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.highlightColor,
    this.backgroundColor,
    this.textColor,
    this.isDark = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 7.h,
      width: 100.w - (CrunchDimensions.horizontalPadding * 2),
      child: NeumorphicButton(
        provideHapticFeedback: false,
        style: NeumorphicStyle(
          color: backgroundColor ?? CrunchColors.payCrunchBlue,
          shadowLightColor: isDark ? CrunchColors.almostBlack : null,
          shape: NeumorphicShape.convex,
          boxShape: NeumorphicBoxShape.roundRect(
            CrunchDimensions.circleBorderRadius,
          ),
        ),
        onPressed: () async {
          await HapticFeedback.mediumImpact();
          FocusManager.instance.primaryFocus?.unfocus();
          onPressed();
        },
        child: Center(
          child: CrunchShimmerText(
            baseColor: textColor,
            highlightColor: highlightColor,
            child: CrunchText(
              text.toUpperCase(),
              style: CrunchTextStyles.primaryButton,
            ),
          ),
        ),
      ),
    );
  }
}
