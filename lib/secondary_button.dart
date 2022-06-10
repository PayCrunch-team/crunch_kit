import 'package:crunch_kit/colors.dart';
import 'package:crunch_kit/dimensions.dart';
import 'package:crunch_kit/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CrunchSecondaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const CrunchSecondaryButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: CrunchColors.almostWhite,
        fixedSize: Size(MediaQuery.of(context).size.width - 16.w, 6.h),
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: CrunchDimensions.circleBorderRadius,
        ),
      ),
      onPressed: () {
        onPressed();
      },
      child: Text(
        text,
        style: CrunchTextStyles.secondaryButton,
      ),
    );
  }
}
