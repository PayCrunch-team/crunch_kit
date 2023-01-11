import 'package:crunch_kit/crunch_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

class CrunchVoucherCard extends StatelessWidget {
  final String name;
  final String desc;
  final Color dominantColor;
  final GestureTapCallback? onPressed;
  final Widget thumbnail;

  const CrunchVoucherCard({
    Key? key,
    required this.name,
    required this.desc,
    required this.dominantColor,
    required this.thumbnail,
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
      child: Container(
        width: 39.w,
        padding: EdgeInsets.symmetric(
            vertical: CrunchDimensions.verticalPadding / 2,
            horizontal: CrunchDimensions.horizontalPadding / 2),
        decoration: BoxDecoration(
          color: dominantColor,
          borderRadius: CrunchDimensions.roundBorderRadius,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 13.w,
                  height: 13.w,
                  decoration: BoxDecoration(
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
                  child: thumbnail,
                ),
                const Spacer(),
                Image.asset(
                  'assets/illustrations/stars.png',
                  width: 14.w,
                ),
              ],
            ),
            SizedBox(height: 1.5.h),
            CrunchText(
              'Up to'.toUpperCase(),
              style: CrunchTextStyles.subTitleWhite,
            ),
            CrunchText(desc, style: CrunchTextStyles.titleWhite),
            const Spacer(),
            Container(
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
