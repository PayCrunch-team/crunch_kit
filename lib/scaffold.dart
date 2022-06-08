import 'package:crunch_kit/back_button.dart';
import 'package:crunch_kit/colors.dart';
import 'package:crunch_kit/dimensions.dart';
import 'package:crunch_kit/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CrunchScaffold extends StatelessWidget {
  final bool hideAppBar;
  final String? title;
  final Widget? body;
  final Widget? bottomNavigationBar;
  final bool showOverlay;
  final Widget? overlay;
  final bool disableBack;

  const CrunchScaffold({
    Key? key,
    this.hideAppBar = false,
    this.title,
    this.body,
    this.bottomNavigationBar,
    this.showOverlay = false,
    this.overlay,
    this.disableBack = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          resizeToAvoidBottomInset: false,
          extendBodyBehindAppBar: true,
          backgroundColor: CrunchColors.almostWhite,
          appBar: hideAppBar
              ? null
              : AppBar(
                  title: title != null
                      ? Text(
                          title!,
                          style: CrunchTextStyles.appBarTitle,
                        )
                      : null,
                  leading: disableBack
                      ? null
                      : const Padding(
                          padding: CrunchDimensions.verticalPadding,
                          child: CrunchBackButton(),
                        ),
                  centerTitle: true,
                  elevation: 0.0,
                  backgroundColor: Colors.transparent,
                ),
          body: Padding(
            padding: EdgeInsets.only(top: 14.h),
            child: body,
          ),
          bottomNavigationBar: SafeArea(
            child: bottomNavigationBar ?? Container(),
          ),
        ),
        Visibility(
          visible: showOverlay,
          child: overlay ?? Container(),
        ),
      ],
    );
  }
}
