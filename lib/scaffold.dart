import 'package:crunch_kit/colors.dart';
import 'package:crunch_kit/dimensions.dart';
import 'package:flutter/material.dart';

class CrunchScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Widget? bottomNavigationBar;
  final bool showOverlay;
  final Widget? overlay;
  final bool disableBack;

  const CrunchScaffold({
    Key? key,
    this.appBar,
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
          appBar: appBar,
          body: Padding(
            padding: CrunchDimensions.horizontalPadding,
            child: body,
          ),
          bottomNavigationBar: bottomNavigationBar,
        ),
        Visibility(
          visible: showOverlay,
          child: overlay ?? Container(),
        ),
      ],
    );
  }
}
