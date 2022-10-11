import 'package:crunch_kit/crunch_kit.dart';
import 'package:flutter/material.dart';
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
              // await HapticFeedback.mediumImpact();
              FocusManager.instance.primaryFocus?.unfocus();
              onPressed!();
            }
          : null,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                vertical: CrunchDimensions.verticalPadding / 2,
                horizontal: CrunchDimensions.horizontalPadding / 1.5),
            width: 38.w,
            decoration: BoxDecoration(
              color: dominantColor,
              borderRadius: CrunchDimensions.roundBorderRadius,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
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
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: const Offset(0, 4),
                      )
                    ],
                    borderRadius: CrunchDimensions.circleBorderRadius,
                  ),
                ),
                SizedBox(height: 2.h),
                CrunchText(
                  'Up to',
                  style: CrunchTextStyles.subTitleWhite,
                ),
                CrunchText(desc, style: CrunchTextStyles.titleWhite),
                Expanded(child: Container()),
                SizedBox(height: 2.h),
              ],
            ),
          ),
          Positioned(
            bottom: 1.5.h,
            child: Container(
              width: 32.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: CrunchColors.black,
                borderRadius: CrunchDimensions.circleBorderRadius,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CrunchText(
                    'claim now',
                    style: CrunchTextStyles.tileTitleBlack.copyWith(
                      color: CrunchColors.almostWhite,
                      fontSize: 12.sp,
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
          ),
          Positioned(
            top: 1.5.h,
            right: 2.w,
            child: Image.asset(
              'assets/graphics/stars.png',
              width: 25.w,
            ),
          ),
        ],
      ),
    );
  }
}
