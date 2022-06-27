import 'dart:async';

import 'package:crunch_kit/crunch_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

class CrunchTile extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final Widget? leading;
  final Widget? trailing;
  final GestureTapCallback? onTap;

  const CrunchTile({
    Key? key,
    this.title,
    this.subTitle,
    this.leading,
    this.trailing,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0.6.h),
      decoration: BoxDecoration(
        color: CrunchColors.superLightWhite,
        borderRadius: CrunchDimensions.roundBorderRadius,
      ),
      child: ListTile(
        title: title != null
            ? CrunchText(
                title!,
                style: CrunchTextStyles.tileTitleBlack,
              )
            : null,
        subtitle: subTitle != null
            ? CrunchText(
                subTitle!,
                style: CrunchTextStyles.subTitleGrey,
              )
            : null,
        leading: leading,
        trailing: trailing,
        onTap: () {
          unawaited(HapticFeedback.mediumImpact());
          onTap!();
        },
      ),
    );
  }
}
