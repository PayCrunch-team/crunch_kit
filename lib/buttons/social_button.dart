import 'package:crunch_kit/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';

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
    return ClipRRect(
      borderRadius: CrunchDimensions.roundBorderRadius,
      child: SignInButton(
        socialButtonType == SocialButtonType.google
            ? Buttons.Google
            : Buttons.AppleDark,
        onPressed: onPressed,
      ),
    );
  }
}

enum SocialButtonType { google, apple }
