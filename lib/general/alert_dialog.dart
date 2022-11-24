import 'package:crunch_kit/crunch_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class CrunchAlertDialog extends StatelessWidget {
  final String? title;
  final String? content;
  final Widget? child;
  final Color? backgroundColor;
  final List<Widget>? actions;
  final String? lottiePath;

  const CrunchAlertDialog({
    Key? key,
    this.title,
    this.content,
    this.child,
    this.backgroundColor,
    this.actions,
    this.lottiePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        GestureDetector(
          onTap: () async {
            await HapticFeedback.mediumImpact();
            Navigator.maybePop(context);
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              const CrunchBlur(),
              Visibility(
                visible: lottiePath != null,
                child: Lottie.asset(
                  lottiePath ?? '',
                  height: 100.h,
                  width: 100.w,
                  repeat: false,
                ),
              ),
            ],
          ),
        ),
        AlertDialog(
          title: title != null
              ? CrunchText(
                  title!,
                  style: CrunchTextStyles.titleBlack,
                )
              : null,
          content: content != null
              ? CrunchText(
                  content!,
                  style: CrunchTextStyles.subTitleGrey,
                  maxLines: 8,
                )
              : child,
          actions: actions,
          elevation: 0.0,
          backgroundColor: backgroundColor,
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
