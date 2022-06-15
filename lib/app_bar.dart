import 'package:crunch_kit/crunch_kit.dart';
import 'package:flutter/material.dart';

class CrunchAppBar extends StatelessWidget {
  final String? title;
  final bool disableBack;

  const CrunchAppBar({
    Key? key,
    this.title,
    this.disableBack = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title != null
          ? Text(
              title!,
              style: CrunchTextStyles.titleBlack,
            )
          : null,
      leading: disableBack ? null : const CrunchBackButton(),
      centerTitle: true,
      elevation: 0.0,
      backgroundColor: Colors.transparent,
    );
  }
}
