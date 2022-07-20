import 'package:crunch_kit/crunch_kit.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:sizer/sizer.dart';

class CrunchPrimaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const CrunchPrimaryButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 7.h,
      width: 100.w - (CrunchDimensions.horizontalPadding * 2),
      child: NeumorphicButton(
        provideHapticFeedback: false,
        style: NeumorphicStyle(
          color: CrunchColors.payCrunchBlue,
          shape: NeumorphicShape.convex,
          boxShape: NeumorphicBoxShape.roundRect(
            CrunchDimensions.circleBorderRadius,
          ),
        ),
        onPressed: () async {
          await HapticFeedback.mediumImpact();
          onPressed();
        },
        child: Center(
          child: CrunchShimmerText(
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
