import 'package:crunch_kit/crunch_kit.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CrunchTransactionTile extends StatelessWidget {
  final Widget headerIcon;
  final String title;
  final String subtitle;
  final Widget statusIcon;
  final String amount;
  final Function() onTap;

  const CrunchTransactionTile({
    Key? key,
    required this.headerIcon,
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.onTap,
    required this.statusIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 1.h),
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
        height: 16.h,
        decoration: BoxDecoration(
          color: CrunchColors.superLightWhite,
          borderRadius: CrunchDimensions.roundBorderRadius,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            headerIcon,
            SizedBox(width: 3.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CrunchText(
                        title,
                        maxLines: 1,
                        style: CrunchTextStyles.tileTitleBlack,
                      ),
                      Icon(
                        Icons.copy_outlined,
                        size: 14.sp,
                        color: CrunchColors.grey,
                      )
                    ],
                  ),
                  SizedBox(height: 0.5.h),
                  CrunchText(
                    subtitle,
                  ),
                  const Divider(),
                  Expanded(child: Container()),
                  Row(
                    children: [
                      CrunchText(
                        amount,
                        style: CrunchTextStyles.titleBlack,
                      ),
                      SizedBox(width: 2.w),
                      statusIcon,
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
