import 'package:crunch_kit/text/text_styles.dart';
import 'package:crunch_kit/utils/colors.dart';
import 'package:crunch_kit/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CrunchErrorCard extends StatelessWidget {
  final String? title;
  final String? details;
  final double? height;
  final double? width;

  const CrunchErrorCard({
    Key? key,
    this.title,
    this.details,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      color: CrunchColors.superLightRed,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: CrunchDimensions.roundBorderRadius,
      ),
      child: SizedBox(
        height: height,
        width: width,
        child: Padding(
          padding: EdgeInsets.all(CrunchDimensions.horizontalPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    title ?? 'Ah shit, here we go again...🤦🏻‍♂️',
                    style: CrunchTextStyles.tileTitleBlack,
                  ),
                ],
              ),
              CrunchText(
                details ??
                    'There was a fuck up from our end and our best minds are on it. Hang on!',
                style: CrunchTextStyles.subTitleRed,
                maxLines: 7,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
