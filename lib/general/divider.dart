import 'package:crunch_kit/crunch_kit.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CrunchDivider extends StatelessWidget {
  final Color? color;
  final double? height;

  const CrunchDivider({Key? key, this.color, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: height ?? 4.h,
      color: color ?? CrunchColors.silver,
    );
  }
}
