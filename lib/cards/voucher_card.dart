import 'package:crunch_kit/crunch_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:sizer/sizer.dart';

class CrunchVoucherCard extends StatelessWidget {
  final String title;
  final String details;
  final PaletteGenerator palette;
  final ImageProvider imageProvider;
  final GestureTapCallback? onPressed;

  const CrunchVoucherCard({
    Key? key,
    required this.title,
    required this.details,
    required this.palette,
    required this.imageProvider,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed != null
          ? () async {
              await HapticFeedback.mediumImpact();
              FocusManager.instance.primaryFocus?.unfocus();
              onPressed!();
            }
          : null,
      // TODO: needs fixing
      child: Container(
        width: 20.w,
        height: 30.h,
        decoration: BoxDecoration(
          color: palette.dominantColor?.color,
          borderRadius: CrunchDimensions.roundBorderRadius,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 10.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
