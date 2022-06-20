import 'package:crunch_kit/text_styles.dart';
import 'package:flutter/material.dart';

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
      onPressed: onPressed,
      child: Text(
        text,
        style: CrunchTextStyles.secondaryButton,
      ),
    );
  }
}
