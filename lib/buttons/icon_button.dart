import 'package:crunch_kit/crunch_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

class CrunchIconButton extends StatelessWidget {
  final IconData icon;
  final String? label;
  final VoidCallback onPressed;

  const CrunchIconButton({
    Key? key,
    required this.icon,
    this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 18.w,
      width: 18.w,
      child: InkWell(
        borderRadius: CrunchDimensions.circleBorderRadius,
        onTap: () async {
          await HapticFeedback.mediumImpact();
          FocusManager.instance.primaryFocus?.unfocus();
          onPressed();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              icon,
              color: CrunchColors.payCrunchBlue,
              size: 22.sp,
            ),
            label != null
                ? CrunchText(
                    label!,
                    style: CrunchTextStyles.iconButton,
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
