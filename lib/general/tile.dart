import 'package:crunch_kit/crunch_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

class CrunchTile extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final Widget? leading;
  final Widget? trailing;
  final GestureTapCallback? onPressed;

  const CrunchTile({
    Key? key,
    this.title,
    this.subTitle,
    this.leading,
    this.trailing,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed != null
          ? () async {
              await HapticFeedback.mediumImpact();
              onPressed!();
            }
          : null,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 0.6.h),
        padding: EdgeInsets.all(CrunchDimensions.horizontalPadding / 2),
        decoration: BoxDecoration(
          color: CrunchColors.superLightWhite,
          borderRadius: CrunchDimensions.roundBorderRadius,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Row(
                children: [
                  leading ?? Container(),
                  SizedBox(width: CrunchDimensions.horizontalPadding / 2),
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Visibility(
                          visible: title != null,
                          child: CrunchText(
                            title!,
                            style: CrunchTextStyles.tileTitleBlack,
                            maxLines: 1,
                          ),
                        ),
                        Visibility(
                          visible: subTitle != null,
                          child: CrunchText(
                            subTitle!,
                            style: CrunchTextStyles.subTitleGrey,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            trailing ?? Container(),
          ],
        ),
      ),
    );
  }
}
