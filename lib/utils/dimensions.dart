import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CrunchDimensions {
  static final verticalPadding = 4.h;
  static final horizontalPadding = 6.w;
  static final roundBorderRadius = BorderRadius.circular(4.w);
  static final circleBorderRadius = BorderRadius.circular(100.w);

  static final topRoundedBorderRadius = BorderRadius.only(
    topLeft: Radius.circular(4.w),
    topRight: Radius.circular(4.w),
  );
  static final bottomRoundedBorderRadius = BorderRadius.only(
    bottomLeft: Radius.circular(4.w),
    bottomRight: Radius.circular(4.w),
  );
  static final leftRoundedBorderRadius = BorderRadius.only(
    topLeft: Radius.circular(4.w),
    bottomLeft: Radius.circular(4.w),
  );
  static final rightRoundedBorderRadius = BorderRadius.only(
    topRight: Radius.circular(4.w),
    bottomRight: Radius.circular(4.w),
  );
}
