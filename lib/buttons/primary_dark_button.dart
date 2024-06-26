import 'package:crunch_kit/crunch_kit.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:sizer/sizer.dart';

class CrunchPrimaryDarkButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? highlightColor;

  const CrunchPrimaryDarkButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.highlightColor,
    this.backgroundColor,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 6.h,
      width: double.infinity,
      child: NeumorphicButton(
        provideHapticFeedback: false,
        style: NeumorphicStyle(
          color: backgroundColor ?? CrunchColors.blackB3,
          shape: NeumorphicShape.convex,
          shadowLightColor: Colors.transparent,
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
          child: CrunchText(
            text.toLowerCase(),
            style: CrunchTextStyles.titleSmallWhite
                .copyWith(color: CrunchColors.whiteW6),
          ),
        ),
      ),
    );
  }
}
