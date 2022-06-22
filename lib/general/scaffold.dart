import 'package:crunch_kit/crunch_kit.dart';
import 'package:flutter/material.dart';

class CrunchScaffold extends StatelessWidget {
  final String? title;
  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Widget? bottomNavigationBar;
  final bool showOverlay;
  final Widget? overlay;
  final bool disableBack;
  final CrunchFloatingCenterButton? floatingCenterButton;

  const CrunchScaffold({
    Key? key,
    this.title,
    this.appBar,
    this.body,
    this.bottomNavigationBar,
    this.showOverlay = false,
    this.overlay,
    this.disableBack = false,
    this.floatingCenterButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          resizeToAvoidBottomInset: false,
          extendBodyBehindAppBar: true,
          backgroundColor: CrunchColors.almostWhite,
          floatingActionButton: floatingCenterButton,
          floatingActionButtonLocation: floatingCenterButton != null
              ? FloatingActionButtonLocation.centerDocked
              : null,
          appBar: appBar ??
              AppBar(
                title: title != null
                    ? Text(
                        title!,
                        style: CrunchTextStyles.titleBlack,
                      )
                    : null,
                leading: disableBack ? null : const CrunchBackButton(),
                centerTitle: true,
                elevation: 0.0,
                backgroundColor: CrunchColors.almostWhite,
              ),
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: CrunchDimensions.horizontalPadding,
            ),
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
