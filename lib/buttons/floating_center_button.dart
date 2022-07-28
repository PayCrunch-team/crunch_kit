import 'package:crunch_kit/crunch_kit.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:sizer/sizer.dart';

class CrunchFloatingCenterButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final Color? color;

  const CrunchFloatingCenterButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await HapticFeedback.mediumImpact();
        FocusManager.instance.primaryFocus?.unfocus();
        onPressed();
      },
      child: SizedBox(
        height: 16.w,
        width: 16.w,
        child: Neumorphic(
          style: NeumorphicStyle(
            color: color ?? CrunchColors.payCrunchBlue,
            shape: NeumorphicShape.flat,
            lightSource: LightSource.top,
            boxShape: NeumorphicBoxShape.roundRect(
              CrunchDimensions.circleBorderRadius,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(CrunchDimensions.horizontalPadding * 0.7),
            child: child,
          ),
        ),
      ),
    );
  }
}
