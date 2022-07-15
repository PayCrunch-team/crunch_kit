import 'package:crunch_kit/text/text_styles.dart';
import 'package:crunch_kit/utils/colors.dart';
import 'package:crunch_kit/utils/dimensions.dart';
import 'package:flutter/material.dart';

class StepperCard extends StatelessWidget {
  final int step;
  final int currentStep;
  final double size;
  final Duration animationDuration;

  const StepperCard({
    Key? key,
    required this.step,
    required this.currentStep,
    required this.size,
    this.animationDuration = const Duration(milliseconds: 500),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      alignment: Alignment.center,
      height: size,
      width: size,
      duration: animationDuration,
      decoration: BoxDecoration(
        color: step == currentStep
            ? CrunchColors.payCrunchBlue
            : CrunchColors.silver,
        borderRadius: CrunchDimensions.circleBorderRadius,
      ),
      child: CrunchText(
        step.toString(),
        style: CrunchTextStyles.titleWhite,
      ),
    );
  }
}
