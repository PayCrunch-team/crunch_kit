import 'package:crunch_kit/crunch_kit.dart';
import 'package:crunch_kit/text/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class CrunchSocialButton extends StatelessWidget {
  final VoidCallback onPressed;
  final SocialButtonType socialButtonType;

  const CrunchSocialButton({
    Key? key,
    required this.onPressed,
    required this.socialButtonType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color bgColor;
    String text;
    TextStyle textStyle;
    String logo;
    Color? logoColor;

    if (socialButtonType == SocialButtonType.apple) {
      bgColor = CrunchColors.almostBlack;
      text = 'Sign in with Apple';
      textStyle = CrunchTextStyles.subTitleWhite;
      logo = 'assets/logo/apple-icon.svg';
      logoColor = CrunchColors.almostWhite;
    } else {
      bgColor = CrunchColors.almostWhite;
      text = 'Sign in with Google';
      textStyle = CrunchTextStyles.subTitleGrey;
      logo = 'assets/logo/google-icon.svg';
    }

    return SizedBox(
      height: 7.h,
      width: 100.w - (CrunchDimensions.horizontalPadding * 2),
      child: NeumorphicButton(
        provideHapticFeedback: false,
        style: NeumorphicStyle(
          color: bgColor,
          shape: NeumorphicShape.flat,
          boxShape: NeumorphicBoxShape.roundRect(
            CrunchDimensions.circleBorderRadius,
          ),
        ),
        onPressed: () async {
          await HapticFeedback.mediumImpact();
          FocusManager.instance.primaryFocus?.unfocus();
          onPressed();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              logo,
              height: 2.h,
              color: logoColor,
            ),
            SizedBox(width: 6.w),
            Text(text, style: textStyle)
          ],
        ),
      ),
    );
  }
}

enum SocialButtonType { google, apple }
