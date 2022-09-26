import 'package:crunch_kit/crunch_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

class CrunchCarouselCard extends StatelessWidget {
  final String title;
  final String details;
  final Color baseColor;
  final Color highlightColor;
  final Widget? image;
  final GestureTapCallback? onPressed;

  const CrunchCarouselCard({
    Key? key,
    required this.title,
    required this.details,
    required this.baseColor,
    required this.highlightColor,
    this.image,
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
        padding: EdgeInsets.all(CrunchDimensions.horizontalPadding),
        margin: EdgeInsets.symmetric(
          horizontal: CrunchDimensions.horizontalPadding / 2,
        ),
        decoration: BoxDecoration(
          borderRadius: CrunchDimensions.roundBorderRadius,
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [baseColor, highlightColor],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            image ?? Container(),
            CrunchText(title, style: CrunchTextStyles.titleWhite),
            CrunchText(
              details,
              style: CrunchTextStyles.subTitleWhite,
              maxLines: 7,
            ),
          ],
        ),
      ),
    );
  }
}
