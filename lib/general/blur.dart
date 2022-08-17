import 'dart:ui';

import 'package:crunch_kit/crunch_kit.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CrunchBlur extends StatelessWidget {
  final Widget? child;
  const CrunchBlur({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Container(
        height: 100.h,
        width: 100.w,
        color: CrunchColors.darkGrey.withOpacity(0.4),
        child: child,
      ),
    );
  }
}
