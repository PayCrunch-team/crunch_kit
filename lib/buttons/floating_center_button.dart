import 'package:crunch_kit/crunch_kit.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class CrunchFloatingCenterButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CrunchFloatingCenterButton({
    Key? key,
    required this.onPressed,
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
            height: 15.5.w,
            width: 15.5.w,
            child: Shimmer.fromColors(
              baseColor: CrunchColors.payCrunchBlue,
              highlightColor: CrunchColors.superLightBlue,
              period: const Duration(seconds: 2),
              child: Container(
                decoration: BoxDecoration(
                  color: CrunchColors.payCrunchBlue,
                  borderRadius: CrunchDimensions.circleBorderRadius,
                ),
              ),
            ),
          ),
          Container(
            height: 13.w,
            width: 13.w,
            decoration: BoxDecoration(
              color: CrunchColors.almostWhite,
              borderRadius: CrunchDimensions.circleBorderRadius,
            ),
            child: Lottie.asset(
              'assets/lottie/qr_scan.json',
              reverse: true,
            ),
          ),
        ],
      ),
    );
  }
}
