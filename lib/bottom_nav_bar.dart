import 'package:crunch_kit/colors.dart';
import 'package:flutter/material.dart';

class CrunchBottomBar extends StatelessWidget {
  final int selectedIndex;
  final List<IconData> icons;
  final List<VoidCallback> actions;

  const CrunchBottomBar({
    Key? key,
    required this.icons,
    required this.actions,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: CrunchColors.pureWhite,
      elevation: 12,
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      child: Container(
        alignment: Alignment.center,
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            5,
            (index) {
              // 4 icons are passed, 1 dummy sized box is placed in between
              // to help with spacing aroung the center floating action button
              if (index < 2) {
                return IconButton(
                  onPressed: actions.elementAt(index),
                  icon: Icon(
                    icons.elementAt(index),
                    color: index == selectedIndex
                        ? CrunchColors.payCrunchBlue
                        : CrunchColors.grey,
                    size: 26,
                  ),
                );
              } else if (index == 2) {
                return const SizedBox(width: 20);
              } else {
                return IconButton(
                  onPressed: actions.elementAt(index - 1),
                  icon: Icon(
                    icons.elementAt(index - 1),
                    color: index - 1 == selectedIndex
                        ? CrunchColors.payCrunchBlue
                        : CrunchColors.grey,
                    size: 26,
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
