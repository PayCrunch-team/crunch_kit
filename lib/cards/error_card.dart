import 'package:crunch_kit/text/text_styles.dart';
import 'package:crunch_kit/utils/colors.dart';
import 'package:crunch_kit/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CrunchErrorCard extends StatelessWidget {
  final String? title;
  final String? details;
  final double? width;

  const CrunchErrorCard({
    Key? key,
    this.title,
    this.details,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: EdgeInsets.symmetric(
        vertical: CrunchDimensions.verticalPadding,
        horizontal: CrunchDimensions.horizontalPadding,
      ),
      padding: EdgeInsets.all(CrunchDimensions.horizontalPadding),
      decoration: BoxDecoration(
        color: CrunchColors.superLightRed,
        borderRadius: CrunchDimensions.roundBorderRadius,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.error_outline_outlined,
                color: CrunchColors.superDarkRed,
                size: 16.sp,
              ),
              SizedBox(width: 2.w),
              CrunchText(
                title ?? 'Error',
                style: CrunchTextStyles.titleGrey,
              ),
            ],
          ),
          SizedBox(height: 1.h),
          CrunchText(
            details ??
                'Something went wrong!',
            style: CrunchTextStyles.subTitleRed,
            maxLines: 5,
          ),
        ],
      ),
    );
  }
}
