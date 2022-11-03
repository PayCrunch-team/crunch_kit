import 'package:crunch_kit/crunch_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:sizer/sizer.dart';

class CrunchVoucherCard extends StatelessWidget {
  final String name;
  final String desc;
  final PaletteGenerator palette;
  final ImageProvider imageProvider;
  final GestureTapCallback? onPressed;

  const CrunchVoucherCard({
    Key? key,
    required this.name,
    required this.desc,
    required this.palette,
    required this.imageProvider,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color dominantColor;
    final double? brightness = palette.dominantColor?.color.computeLuminance();

    if (brightness != null &&
        brightness > 0.5 &&
        palette.darkVibrantColor != null) {
      dominantColor = palette.darkVibrantColor!.color;
    } else {
      dominantColor = palette.dominantColor!.color;
    }

    return GestureDetector(
      onTap: onPressed != null
          ? () async {
              await HapticFeedback.mediumImpact();
              FocusManager.instance.primaryFocus?.unfocus();
              onPressed!();
            }
          : null,
      child: Container(
        width: 42.w,
        height: 36.h,
        padding: EdgeInsets.symmetric(
          vertical: CrunchDimensions.verticalPadding / 2,
          horizontal: CrunchDimensions.horizontalPadding / 2,
        ),
        decoration: BoxDecoration(
          color: dominantColor,
          borderRadius: CrunchDimensions.roundBorderRadius,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 13.w,
                      height: 13.w,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: CrunchColors.black.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: const Offset(0, 4),
                          )
                        ],
                        borderRadius: CrunchDimensions.circleBorderRadius,
                      ),
                    ),
                    Image.asset(
                      'assets/illustrations/stars.png',
                      width: 22.w,
                    ),
                  ],
                ),
                CrunchText(
                  'Up to'.toUpperCase(),
                  style: CrunchTextStyles.subTitleWhite,
                ),
                CrunchText(desc, style: CrunchTextStyles.titleWhite),
              ],
            ),
            Container(
              width: 32.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: CrunchColors.black,
                borderRadius: CrunchDimensions.roundBorderRadius / 2,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CrunchShimmerText(
                    highlightColor: CrunchColors.grey,
                    child: CrunchText(
                      'Claim now'.toUpperCase(),
                      style: CrunchTextStyles.titleWhite.copyWith(
                        fontSize: 8.sp,
                      ),
                    ),
                  ),
                  SizedBox(width: 1.w),
                  Icon(
                    Icons.arrow_right_alt,
                    color: CrunchColors.almostWhite,
                    size: 16.sp,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
