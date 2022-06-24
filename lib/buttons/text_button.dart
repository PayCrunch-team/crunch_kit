import 'dart:async';

import 'package:crunch_kit/crunch_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CrunchTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const CrunchTextButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        unawaited(HapticFeedback.mediumImpact());
        onPressed();
      },
      child: CrunchText(
        text,
        style: CrunchTextStyles.secondaryButton,
      ),
    );
  }
}
