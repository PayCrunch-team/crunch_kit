import 'dart:ui';

import 'package:crunch_kit/crunch_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class CrunchScaffold extends StatelessWidget {
  final String? title;
  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Widget? bottomNavigationBar;
  final bool showOverlay;
  final bool disableBack;
  final bool disableAppBar;
  final CrunchFloatingCenterButton? floatingCenterButton;
  final bool? resizeToAvoidBottomInsets;
  final String? overlayAssetPath;

  const CrunchScaffold({
    Key? key,
    this.title,
    this.appBar,
    this.body,
    this.bottomNavigationBar,
    this.showOverlay = false,
    this.disableBack = false,
    this.disableAppBar = false,
    this.floatingCenterButton,
    this.overlayAssetPath,
    this.resizeToAvoidBottomInsets = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          resizeToAvoidBottomInset: resizeToAvoidBottomInsets,
          backgroundColor: CrunchColors.almostWhite,
          floatingActionButton: floatingCenterButton,
          floatingActionButtonLocation: floatingCenterButton != null
              ? FloatingActionButtonLocation.centerDocked
              : null,
          appBar: disableAppBar
              ? null
              : appBar ??
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
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              color: CrunchColors.darkGrey.withOpacity(0.4),
              child: Center(
                child: Lottie.asset(
                  overlayAssetPath ?? 'assets/lottie/loading.json',
                  height: 24.w,
                  width: 24.w,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
