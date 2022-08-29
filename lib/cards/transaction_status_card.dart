import 'package:crunch_kit/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TransactionStatusChip extends StatelessWidget {
  final Color backgroundColor;
  final Color color;
  final IconData icon;
  const TransactionStatusChip({
    Key? key,
    required this.backgroundColor,
    required this.color,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: CrunchDimensions.circleBorderRadius,
      ),
      child: Icon(
        icon,
        color: color,
        size: 14.sp,
      ),
    );
  }
}
