import 'package:crunch_kit/crunch_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CrunchAlertDialog extends StatelessWidget {
  final String? title;
  final String? content;
  final List<Widget>? actions;

  const CrunchAlertDialog({
    Key? key,
    this.title,
    this.content,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        GestureDetector(
          onTap: () async {
            await HapticFeedback.mediumImpact();
            Navigator.pop(context);
          },
          child: const CrunchBlur(),
        ),
        AlertDialog(
          title: title != null
              ? Center(
                  child: CrunchText(
                    title!,
                    style: CrunchTextStyles.titleBlack,
                  ),
                )
              : null,
          content: content != null
              ? CrunchText(
                  content!,
                  style: CrunchTextStyles.subTitleGrey,
                  maxLines: 8,
                )
              : null,
          actions: actions,
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: CrunchDimensions.roundBorderRadius,
          ),
          titlePadding: EdgeInsets.only(
            top: CrunchDimensions.horizontalPadding,
            left: CrunchDimensions.horizontalPadding,
            right: CrunchDimensions.horizontalPadding,
          ),
          contentPadding: EdgeInsets.only(
            top: CrunchDimensions.horizontalPadding,
            left: CrunchDimensions.horizontalPadding,
            right: CrunchDimensions.horizontalPadding,
          ),
        ),
      ],
    );
  }
}
