import 'package:crunch_kit/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CrunchText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final int? maxLines;
  final TextAlign? align;

  const CrunchText(
    this.text, {
    Key? key,
    this.style,
    this.maxLines,
    this.align,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      maxLines: maxLines ?? 3,
      overflow: TextOverflow.ellipsis,
      textAlign: align,
    );
  }
}

class CrunchTextStyles {
  static final tileTitleBlack = TextStyle(
    color: CrunchColors.almostBlack,
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
  );

  static final tileTitleWhite = TextStyle(
    color: CrunchColors.almostWhite,
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
  );

  static final titleBlack = TextStyle(
    color: CrunchColors.almostBlack,
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
  );

  static final titleWhite = TextStyle(
    color: CrunchColors.almostWhite,
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
  );

  static final titleBlue = TextStyle(
    color: CrunchColors.payCrunchBlue,
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
  );

  static final titleGrey = TextStyle(
    color: CrunchColors.darkGrey,
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
  );

  static final subTitleWhite = TextStyle(
    color: CrunchColors.almostWhite,
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
  );

  static final subTitleGrey = TextStyle(
    color: CrunchColors.darkGrey,
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
  );

  static final subTitleRed = TextStyle(
    color: CrunchColors.superDarkRed,
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
  );

  static final subTitleSilver = TextStyle(
    color: CrunchColors.silver,
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
  );

  static final subHeadingGrey = TextStyle(
    color: CrunchColors.darkGrey,
    fontSize: 10.sp,
    fontWeight: FontWeight.w800,
  );

  static final headingWhite = TextStyle(
    color: CrunchColors.almostWhite,
    fontSize: 28.sp,
    fontWeight: FontWeight.w800,
  );

  static final headingBlack = TextStyle(
    color: CrunchColors.almostBlack,
    fontSize: 28.sp,
    fontWeight: FontWeight.w800,
  );

  static final headingExtendedWhite = TextStyle(
    color: CrunchColors.almostWhite,
    fontFamily: 'MonumentExtended',
    fontSize: 26.sp,
    fontWeight: FontWeight.w500,
  );

  static final headingExtendedGrey = TextStyle(
    color: CrunchColors.grey,
    fontFamily: 'MonumentExtended',
    fontSize: 26.sp,
    fontWeight: FontWeight.w500,
  );

  static final headingExtendedWhiteBold = TextStyle(
    color: CrunchColors.almostWhite,
    fontFamily: 'MonumentExtended',
    fontSize: 26.sp,
    fontWeight: FontWeight.w600,
  );

  static final headingExtendedGreyBold = TextStyle(
    color: CrunchColors.grey,
    fontFamily: 'MonumentExtended',
    fontSize: 26.sp,
    fontWeight: FontWeight.w600,
  );

  static final headingExtendedBlack = TextStyle(
    color: CrunchColors.almostBlack,
    fontFamily: 'MonumentExtended',
    fontSize: 26.sp,
    fontWeight: FontWeight.w500,
  );

  static final primaryButton = TextStyle(
    color: CrunchColors.almostWhite,
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
  );

  static final secondaryButton = TextStyle(
    color: CrunchColors.payCrunchBlue,
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
  );

  static final secondaryButtonBlack = TextStyle(
    color: CrunchColors.almostBlack,
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
  );

  static final iconButton = TextStyle(
    color: CrunchColors.payCrunchBlue,
    fontSize: 10.sp,
    fontWeight: FontWeight.w500,
  );
}
