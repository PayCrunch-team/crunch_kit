import 'package:crunch_kit/crunch_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

class CrunchCarouselCard extends StatelessWidget {
  final String title;
  final String details;
  final Color color;
  final Color? textColor;
  final Widget? image;
  final Widget? overlay;
  final GestureTapCallback? onPressed;

  const CrunchCarouselCard({
    Key? key,
    required this.title,
    required this.details,
    required this.color,
    this.textColor,
    this.image,
    this.overlay,
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
        width: 100.w,
        margin: EdgeInsets.symmetric(
          horizontal: CrunchDimensions.horizontalPadding / 3,
        ),
        decoration: BoxDecoration(
          color: color,
          borderRadius: CrunchDimensions.roundBorderRadius,
        ),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(CrunchDimensions.horizontalPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  image ?? Container(),
                  CrunchText(
                    title,
                    style:
                        CrunchTextStyles.titleBlack.copyWith(color: textColor),
                  ),
                  CrunchText(
                    details,
                    style: CrunchTextStyles.subTitleGrey,
                  ),
                ],
              ),
            ),
            overlay ?? Container(),
          ],
        ),
      ),
    );
  }
}
