import 'package:crunch_kit/crunch_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:sizer/sizer.dart';

class CrunchVoucherCard extends StatelessWidget {
  final String desc;
  final PaletteGenerator palette;
  final ImageProvider imageProvider;
  final GestureTapCallback? onPressed;

  const CrunchVoucherCard({
    Key? key,
    required this.desc,
    required this.palette,
    required this.imageProvider,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color dominantColor;
    final double? brightness = palette.dominantColor?.color.computeLuminance();

    if (brightness != null && brightness > 0.1) {
      dominantColor = palette.dominantColor!.color;
    } else {
      dominantColor = palette.lightMutedColor!.color;
    }

    return GestureDetector(
      onTap: onPressed != null
          ? () async {
              await HapticFeedback.mediumImpact();
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
              color: CrunchColors.darkGrey.withOpacity(0.2),
              borderRadius: CrunchDimensions.roundBorderRadius,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: CrunchDimensions.circleBorderRadius,
                  child: Container(
                    width: 12.w,
                    height: 12.w,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 2.h),
                CrunchText(
                  'Up to',
                  style: CrunchTextStyles.subHeadingGrey.copyWith(
                    color: dominantColor,
                    fontWeight: FontWeight.w100,
                  ),
                ),
                CrunchText(
                  desc,
                  // '₹${formatNum(voucher.valueDenominations.last, showDecimal: false)} OFF',
                  style: CrunchTextStyles.titleBlack
                      .copyWith(color: dominantColor),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 2.h,
            right: 3.5.w,
            child: Container(
              height: 4.5.h,
              width: 30.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.w),
                color: dominantColor,
              ),
            ),
          ),
          Positioned(
            bottom: 2.5.h,
            right: 4.5.w,
            child: Container(
              height: 4.5.h,
              width: 30.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.w),
                color: CrunchColors.black,
              ),
              alignment: Alignment.center,
              child: CrunchShimmerText(
                highlightColor: CrunchColors.silver,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CrunchText(
                      'claim now',
                      style: CrunchTextStyles.iconButton
                          .copyWith(color: CrunchColors.almostWhite),
                    ),
                    SizedBox(width: 2.w),
                    const Icon(
                      Icons.arrow_right_alt,
                      color: CrunchColors.silver,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
