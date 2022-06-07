import 'package:crunch_kit/colors.dart';
import 'package:flutter/material.dart';

class CrunchBackButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const CrunchBackButton({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: Container(
        color: CrunchColors.superLightGrey,
        child: IconButton(
          onPressed: () =>
              onPressed ??
              {
                if (Navigator.canPop(context)) {Navigator.pop(context)}
              },
          icon: const Icon(Icons.chevron_left),
        ),
      ),
    );
  }
}
