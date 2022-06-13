import 'dart:async';

import 'package:crunch_kit/colors.dart';
import 'package:crunch_kit/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:sizer/sizer.dart';

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
      onPressed: () {
        unawaited(HapticFeedback.mediumImpact());
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
