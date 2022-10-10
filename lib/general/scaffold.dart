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
  final bool showLogoutButton;
  final Function()? onLogout;
  final CrunchFloatingCenterButton? floatingCenterButton;
  final bool? resizeToAvoidBottomInsets;
  final String? overlayAssetPath;
  final Widget? kycBar;
  final bool isDark;

  const CrunchScaffold({
    Key? key,
    this.title,
    this.appBar,
    this.body,
    this.bottomNavigationBar,
    this.showOverlay = false,
    this.disableBack = false,
    this.disableAppBar = false,
    this.showLogoutButton = false,
    this.onLogout,
    this.floatingCenterButton,
    this.overlayAssetPath,
    this.resizeToAvoidBottomInsets = true,
    this.kycBar,
    this.isDark = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          resizeToAvoidBottomInset: resizeToAvoidBottomInsets,
          backgroundColor:
              isDark ? CrunchColors.almostBlack : CrunchColors.superLightWhite,
          floatingActionButton: floatingCenterButton,
          floatingActionButtonLocation: floatingCenterButton != null
              ? FloatingActionButtonLocation.centerFloat
              : null,
          appBar: disableAppBar
              ? null
              : appBar ??
                  AppBar(
                    title: title != null
                        ? Text(
                            title!,
                            style: isDark
                                ? CrunchTextStyles.titleWhite
                                : CrunchTextStyles.titleBlack,
                          )
                        : null,
                    leading: disableBack ? null : const CrunchBackButton(),
                    centerTitle: true,
                    elevation: 0.0,
                    backgroundColor: isDark
                        ? CrunchColors.almostBlack
                        : CrunchColors.superLightWhite,
                    actions: showLogoutButton
                        ? [
                            IconButton(
                              padding: EdgeInsets.only(right: 4.w),
                              onPressed: onLogout,
                              icon: const Icon(
                                Icons.logout,
                                color: CrunchColors.almostBlack,
                              ),
                            )
                          ]
                        : null,
                  ),
          body: body != null
              ? kycBar != null
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        kycBar!,
                        Expanded(child: body!),
                      ],
                    )
                  : body
              : null,
          bottomNavigationBar: bottomNavigationBar,
        ),
        Visibility(
          visible: showOverlay,
          child: CrunchBlur(
            child: Center(
              child: Lottie.asset(
                overlayAssetPath ?? 'assets/lottie/loading.json',
                height: 24.w,
                width: 24.w,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
