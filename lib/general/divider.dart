import 'package:crunch_kit/crunch_kit.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CrunchDivider extends StatelessWidget {
  const CrunchDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 4.h,
      color: CrunchColors.silver,
    );
  }
}
