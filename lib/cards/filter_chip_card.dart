import 'package:crunch_kit/crunch_kit.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CrunchFilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final Function(bool) onSelect;
  const CrunchFilterChip({
    Key? key,
    required this.label,
    required this.isSelected,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 1.w),
      child: FilterChip(
        padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
        pressElevation: 1.0,
        label: Text(
          label,
          style: isSelected
              ? CrunchTextStyles.subTitleWhite
              : CrunchTextStyles.subTitleGrey,
        ),
        onSelected: onSelect,
        backgroundColor:
            isSelected ? CrunchColors.payCrunchBlue : CrunchColors.almostWhite,
        side: isSelected ? null : const BorderSide(color: CrunchColors.grey),
      ),
    );
  }
}
