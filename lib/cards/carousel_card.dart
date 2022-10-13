import 'package:crunch_kit/crunch_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: CrunchDimensions.verticalPadding,
        horizontal: CrunchDimensions.horizontalPadding / 3,
      ),
      child: CrunchNeumorphicCard(
        color: color,
        padding: EdgeInsets.zero,
        onPressed: onPressed,
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
