import 'package:crunch_kit/crunch_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CrunchFloatingCenterButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;

  const CrunchFloatingCenterButton({
    Key? key,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: CrunchColors.payCrunchBlue,
        fixedSize: const Size(65, 65),
        shape: RoundedRectangleBorder(
          borderRadius: CrunchDimensions.circleBorderRadius,
        ),
      ),
      onPressed: () async {
        await HapticFeedback.mediumImpact();
        FocusManager.instance.primaryFocus?.unfocus();
        onPressed();
      },
      child: Icon(
        icon,
        color: CrunchColors.almostWhite,
        size: 26,
      ),
    );
  }
}
