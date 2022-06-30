import 'package:crunch_kit/text/text_styles.dart';
import 'package:crunch_kit/utils/colors.dart';
import 'package:crunch_kit/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CrunchErrorCard extends StatelessWidget {
  final String? title;
  final String? details;
  const CrunchErrorCard({Key? key, this.title, this.details}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
      decoration: BoxDecoration(
        color: CrunchColors.superLightRed,
        borderRadius: CrunchDimensions.roundBorderRadius,
        border: Border.all(
          color: CrunchColors.superDarkRed,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(2.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Icon(
                  Icons.error_outline_outlined,
                  color: CrunchColors.superDarkRed,
                  size: 16.sp,
                ),
                SizedBox(
                  width: 2.w,
                ),
                CrunchText(
                  title ?? 'Oops!',
                  style: CrunchTextStyles.tileTitleBlack,
                ),
              ],
            ),
            SizedBox(height: 1.h),
            Row(
              children: [
                SizedBox(
                  width: 8.w,
                ),
                Expanded(
                  child: CrunchText(
                    details ?? 'Something went wrong, please try again later',
                    style: CrunchTextStyles.subTitleWhite.copyWith(
                      color: CrunchColors.superDarkRed,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
