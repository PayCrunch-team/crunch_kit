import 'package:crunch_kit/crunch_kit.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class CrunchFloatingCenterButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;

  const CrunchFloatingCenterButton({
    Key? key,
    required this.onPressed,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await HapticFeedback.mediumImpact();
        FocusManager.instance.primaryFocus?.unfocus();
        onPressed();
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: 18.w,
            width: 18.w,
            child: Shimmer.fromColors(
              baseColor: CrunchColors.superLightWhite,
              highlightColor: CrunchColors.silver,
              period: const Duration(seconds: 2),
              child: Container(
                decoration: BoxDecoration(
                  color: CrunchColors.superLightWhite,
                  borderRadius: CrunchDimensions.circleBorderRadius,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15.w,
            width: 15.w,
            child: Neumorphic(
              style: NeumorphicStyle(
                color: CrunchColors.payCrunchBlue,
                shape: NeumorphicShape.flat,
                lightSource: LightSource.top,
                boxShape: NeumorphicBoxShape.roundRect(
                  CrunchDimensions.circleBorderRadius,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(
                  CrunchDimensions.horizontalPadding * 0.7,
                ),
                child: child,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
